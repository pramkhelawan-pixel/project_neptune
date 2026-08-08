import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NetworkException implements Exception {
  final String message;

  const NetworkException(this.message);

  @override
  String toString() => message;

  factory NetworkException.fromDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return const NetworkException(
          'Connection timed out. Please check your internet connection.',
        );

      case DioExceptionType.sendTimeout:
        return const NetworkException(
          'Request timed out while sending data.',
        );

      case DioExceptionType.receiveTimeout:
        return const NetworkException(
          'Server took too long to respond.',
        );

      case DioExceptionType.transformTimeout:
        return const NetworkException(
          'The server took too long to process the response.',
        );

      case DioExceptionType.badCertificate:
        return const NetworkException(
          'Invalid security certificate.',
        );

      case DioExceptionType.badResponse:
        return NetworkException(
          'Server error: ${exception.response?.statusCode ?? 'Unknown'}',
        );

      case DioExceptionType.cancel:
        return const NetworkException(
          'Request was cancelled.',
        );

      case DioExceptionType.connectionError:
        return const NetworkException(
          'No internet connection available.',
        );

      case DioExceptionType.unknown:
        return NetworkException(
          exception.message ?? 'An unexpected network error occurred.',
        );
    }
  }

  factory NetworkException.fromFunctionException(
    FunctionException exception,
  ) {
    switch (exception.status) {
      case 401:
      case 403:
        return const NetworkException(
          'You are not authorized to perform this request.',
        );

      case 404:
        return const NetworkException(
          'The requested service could not be found.',
        );

      case 503:
        return const NetworkException(
          'The service is temporarily unavailable. Please try again shortly.',
        );

      default:
        return NetworkException(
          exception.reasonPhrase ?? 'Server error: ${exception.status}',
        );
    }
  }
}