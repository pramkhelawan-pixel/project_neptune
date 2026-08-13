import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/auth/not_authenticated_exception.dart';
import '../../../../core/network/network_exception.dart';
import '../../../../core/services/supabase_service.dart';
import '../../../authentication/data/auth_repository.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../mappers/profile_mapper.dart';
import '../models/profile_dto.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({
    SupabaseClient? client,
    AuthRepository? authRepository,
  })  : _client = client ?? SupabaseService.client,
        _authRepository =
            authRepository ?? AuthRepository(client ?? SupabaseService.client);

  static const _table = 'profiles';

  final SupabaseClient _client;
  final AuthRepository _authRepository;

  String _requireUserId() {
    final user = _authRepository.currentUser;

    if (user == null) {
      throw const NotAuthenticatedException(
        'You must be signed in to view your profile.',
      );
    }

    return user.id;
  }

  @override
  Future<Profile?> getCurrentProfile() async {
    final userId = _requireUserId();

    final row = await _client
        .from(_table)
        .select()
        .eq('id', userId)
        .maybeSingle();

    if (row == null) {
      return null;
    }

    return ProfileMapper.toDomain(
      ProfileDto.fromJson(row),
    );
  }

  @override
  Future<void> deleteAccount() async {
    _requireUserId();

    try {
      final response = await _client.functions.invoke('delete-account');

      final data = response.data;
      final succeeded = data is Map && data['success'] == true;

      if (!succeeded) {
        final serverMessage =
            data is Map ? data['error'] as String? : null;
        throw NetworkException(
          serverMessage ?? 'Failed to delete account. Please try again.',
        );
      }
    } on FunctionException catch (e) {
      throw NetworkException.fromFunctionException(e);
    }
  }
}
