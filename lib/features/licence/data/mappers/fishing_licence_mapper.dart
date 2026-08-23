import '../../domain/entities/fishing_licence.dart';
import '../models/fishing_licence_dto.dart';

class FishingLicenceMapper {
  const FishingLicenceMapper._();

  static FishingLicence toDomain(FishingLicenceDto dto) {
    return FishingLicence(
      pdfPath: dto.pdfPath,
      anglerName: dto.anglerName,
      licenceNumber: dto.licenceNumber,
      issuingAuthority: dto.issuingAuthority,
      validFrom: DateTime.parse(dto.validFrom),
      expiryDate: DateTime.parse(dto.expiryDate),
      originalFileName: dto.originalFileName,
    );
  }

  static FishingLicenceDto toDto(FishingLicence licence) {
    return FishingLicenceDto(
      pdfPath: licence.pdfPath,
      anglerName: licence.anglerName,
      licenceNumber: licence.licenceNumber,
      issuingAuthority: licence.issuingAuthority,
      validFrom: licence.validFrom.toIso8601String(),
      expiryDate: licence.expiryDate.toIso8601String(),
      originalFileName: licence.originalFileName,
    );
  }
}
