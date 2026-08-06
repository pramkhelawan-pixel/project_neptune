import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/auth/not_authenticated_exception.dart';
import '../../../../core/services/supabase_service.dart';
import '../../../authentication/data/auth_repository.dart';
import '../../domain/entities/fishing_session.dart';
import '../../domain/repositories/fishing_session_repository.dart';
import '../mappers/fishing_session_mapper.dart';
import '../models/fishing_session_dto.dart';

class FishingSessionRepositoryImpl implements FishingSessionRepository {
  FishingSessionRepositoryImpl({
    SupabaseClient? client,
    AuthRepository? authRepository,
  })  : _client = client ?? SupabaseService.client,
        _authRepository =
            authRepository ?? AuthRepository(client ?? SupabaseService.client);

  static const _table = 'fishing_sessions';

  final SupabaseClient _client;
  final AuthRepository _authRepository;

  String _requireUserId() {
    final user = _authRepository.currentUser;

    if (user == null) {
      throw const NotAuthenticatedException(
        'You must be signed in to save a fishing session.',
      );
    }

    return user.id;
  }

  @override
  Future<List<FishingSession>> getAll() async {
    final rows = await _client.from(_table).select();

    return rows
        .map(
          (row) => FishingSessionMapper.toDomain(
            FishingSessionDto.fromJson(row),
          ),
        )
        .toList();
  }

  @override
  Future<FishingSession?> getById(
    String id,
  ) async {
    final row =
        await _client.from(_table).select().eq('id', id).maybeSingle();

    if (row == null) {
      return null;
    }

    return FishingSessionMapper.toDomain(
      FishingSessionDto.fromJson(row),
    );
  }

  @override
  Future<void> save(
    FishingSession session,
  ) async {
    final userId = _requireUserId();

    final dto = FishingSessionMapper.toDto(
      session,
      userId: userId,
    );

    await _client.from(_table).upsert(dto.toJson());
  }

  @override
  Future<void> delete(
    String id,
  ) async {
    await _client.from(_table).delete().eq('id', id);
  }
}
