import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/network/network_exception.dart';
import '../../../../core/services/supabase_service.dart';

import '../models/tide_dto.dart';

/// Calls the get-tides Edge Function (never WorldTides directly — see
/// docs/planning/tide_caching_spec.md). The function itself decides whether
/// to serve a cached, fresh, or stale-fallback response, and is also where
/// the WorldTides status-check lives now (before a response is ever cached).
class TideRemoteDataSource {
  final SupabaseClient _client;

  TideRemoteDataSource({
    SupabaseClient? client,
  }) : _client = client ?? SupabaseService.client;

  static const _functionName = 'get-tides';
  static const _timeout = Duration(seconds: 15);
  static const _retryDelay = Duration(seconds: 2);

  Future<TideDto> getTides({
    required double latitude,
    required double longitude,
  }) async {
    try {
      return await _fetch(
        latitude: latitude,
        longitude: longitude,
      );
    } on TimeoutException {
      return _retry(
        latitude: latitude,
        longitude: longitude,
      );
    } on FunctionException catch (e) {
      // Only retry server-side failures — a 4xx (bad request, unauthorized)
      // will fail identically a second time.
      if (e.status >= 500) {
        return _retry(
          latitude: latitude,
          longitude: longitude,
        );
      }

      throw NetworkException.fromFunctionException(e);
    }
  }

  Future<TideDto> _retry({
    required double latitude,
    required double longitude,
  }) async {
    await Future<void>.delayed(_retryDelay);

    try {
      return await _fetch(
        latitude: latitude,
        longitude: longitude,
      );
    } on TimeoutException {
      throw const NetworkException(
        'The tide service took too long to respond. Please try again.',
      );
    } on FunctionException catch (e) {
      throw NetworkException.fromFunctionException(e);
    }
  }

  Future<TideDto> _fetch({
    required double latitude,
    required double longitude,
  }) async {
    final response = await _client.functions
        .invoke(
          _functionName,
          body: {
            'latitude': latitude,
            'longitude': longitude,
          },
        )
        .timeout(_timeout);

    return TideDto.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
