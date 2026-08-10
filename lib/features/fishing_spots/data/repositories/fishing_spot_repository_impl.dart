import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/auth/not_authenticated_exception.dart';
import '../../../../core/services/supabase_service.dart';
import '../../../authentication/data/auth_repository.dart';
import '../../domain/entities/fishing_spot.dart';
import '../../domain/repositories/fishing_spot_repository.dart';
import '../mappers/fishing_spot_mapper.dart';
import '../models/fishing_spot_dto.dart';

class FishingSpotRepositoryImpl implements FishingSpotRepository {
  FishingSpotRepositoryImpl({
    SupabaseClient? client,
    AuthRepository? authRepository,
  })  : _client = client ?? SupabaseService.client,
        _authRepository =
            authRepository ?? AuthRepository(client ?? SupabaseService.client);

  static const _table = 'fishing_spots';

  final SupabaseClient _client;
  final AuthRepository _authRepository;

  String _requireUserId() {
    final user = _authRepository.currentUser;

    if (user == null) {
      throw const NotAuthenticatedException(
        'You must be signed in to view the fishing spot directory.',
      );
    }

    return user.id;
  }

  @override
  Future<List<FishingSpot>> getAll() async {
    _requireUserId();

    final rows = await _client.from(_table).select();

    return rows
        .map(
          (row) => FishingSpotMapper.toDomain(
            FishingSpotDto.fromJson(row),
          ),
        )
        .toList();
  }

  @override
  Future<FishingSpot?> getById(
    String id,
  ) async {
    _requireUserId();

    final row =
        await _client.from(_table).select().eq('id', id).maybeSingle();

    if (row == null) {
      return null;
    }

    return FishingSpotMapper.toDomain(
      FishingSpotDto.fromJson(row),
    );
  }

  @override
  Future<List<FishingSpot>> getByProvince(
    String province,
  ) async {
    _requireUserId();

    final rows =
        await _client.from(_table).select().ilike('province', province);

    return rows
        .map(
          (row) => FishingSpotMapper.toDomain(
            FishingSpotDto.fromJson(row),
          ),
        )
        .toList();
  }

  @override
  Future<List<FishingSpot>> getBySpecies(
    String species,
  ) async {
    _requireUserId();

    final rows = await _client
        .from(_table)
        .select()
        .contains('target_species', [species]);

    return rows
        .map(
          (row) => FishingSpotMapper.toDomain(
            FishingSpotDto.fromJson(row),
          ),
        )
        .toList();
  }
}
