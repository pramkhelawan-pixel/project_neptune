import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/fishing_licence.dart';
import '../../domain/repositories/licence_repository.dart';
import '../mappers/fishing_licence_mapper.dart';
import '../models/fishing_licence_dto.dart';
import '../services/licence_pdf_storage.dart';

/// Local-only implementation of [LicenceRepository]. Composes
/// [LicencePdfStorage] (pure file operations) with [SharedPreferences]
/// (metadata only) -- no Premium/entitlement logic and no network client
/// anywhere in this class.
class LicenceRepositoryImpl implements LicenceRepository {
  LicenceRepositoryImpl({required LicencePdfStorage pdfStorage})
      : _pdfStorage = pdfStorage;

  static const _metadataKey = 'licence_metadata_v1';

  final LicencePdfStorage _pdfStorage;

  @override
  Future<FishingLicence?> getLicence() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_metadataKey);

    if (json == null) {
      return null;
    }

    final dto = FishingLicenceDto.fromJson(
      jsonDecode(json) as Map<String, dynamic>,
    );

    return FishingLicenceMapper.toDomain(dto);
  }

  @override
  Future<void> saveLicence({
    required FishingLicence licence,
    required File pdfFile,
  }) async {
    final existing = await getLicence();

    // Validate and store the new PDF before touching any existing state.
    // If this throws (e.g. InvalidPdfException), nothing about a
    // previously-saved licence has been modified.
    final newPath = await _pdfStorage.store(pdfFile);

    final stored = FishingLicence(
      pdfPath: newPath,
      anglerName: licence.anglerName,
      licenceNumber: licence.licenceNumber,
      issuingAuthority: licence.issuingAuthority,
      validFrom: licence.validFrom,
      expiryDate: licence.expiryDate,
      originalFileName: licence.originalFileName,
    );

    final prefs = await SharedPreferences.getInstance();
    final dto = FishingLicenceMapper.toDto(stored);
    await prefs.setString(_metadataKey, jsonEncode(dto.toJson()));

    // Only now that the new PDF and metadata are both safely committed is
    // the previous PDF file removed, so a failure above never leaves the
    // user without their existing valid licence.
    if (existing != null && existing.pdfPath != newPath) {
      await _pdfStorage.delete(existing.pdfPath);
    }
  }

  @override
  Future<void> deleteLicence() async {
    final existing = await getLicence();

    if (existing != null) {
      await _pdfStorage.delete(existing.pdfPath);
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_metadataKey);
  }
}
