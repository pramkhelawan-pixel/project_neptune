import 'package:dio/dio.dart';

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
}