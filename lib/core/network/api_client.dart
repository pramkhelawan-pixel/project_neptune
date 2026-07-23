import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'api_constants.dart';
import 'network_exception.dart';

class ApiClient {
  late final Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: ApiConstants.connectionTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        sendTimeout: ApiConstants.sendTimeout,
        responseType: ResponseType.json,
        headers: const {
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: false,
        responseHeader: false,
        responseBody: false,
        error: true,
      ),
    );
  }

  Future<Response<dynamic>> get(
      String url, {
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
      }) async {
    try {
      return await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  Future<Response<dynamic>> getFromBaseUrl({
    required String baseUrl,
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      return await _dio.get(
        '$baseUrl$endpoint',
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  String? get stormglassApiKey =>
      dotenv.env['STORMGLASS_API_KEY'];
}