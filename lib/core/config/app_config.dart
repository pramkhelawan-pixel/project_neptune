import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Centralised application configuration.
///
/// All environment variables are accessed through this class.
/// No other class should access dotenv directly.
class AppConfig {
  AppConfig._();

  static String get openMeteoBaseUrl =>
      dotenv.env['OPEN_METEO_BASE_URL'] ?? '';

  static String get openMeteoMarineBaseUrl =>
      dotenv.env['OPEN_METEO_MARINE_BASE_URL'] ?? '';

  static String get worldTidesApiKey =>
      dotenv.env['WORLDTIDES_API_KEY'] ?? '';

  static String get stormglassApiKey =>
      dotenv.env['STORMGLASS_API_KEY'] ?? '';

  static String get supabaseUrl =>
      dotenv.env['SUPABASE_URL'] ?? '';

  static String get supabaseAnonKey =>
      dotenv.env['SUPABASE_ANON_KEY'] ?? '';

  /// Validates that the required environment variables exist.
  static void validate() {
    final missing = <String>[];

    if (openMeteoBaseUrl.isEmpty) {
      missing.add('OPEN_METEO_BASE_URL');
    }

    if (openMeteoMarineBaseUrl.isEmpty) {
      missing.add('OPEN_METEO_MARINE_BASE_URL');
    }

    if (worldTidesApiKey.isEmpty) {
      missing.add('WORLDTIDES_API_KEY');
    }

    if (missing.isNotEmpty) {
      throw Exception(
        'Missing required environment variables: ${missing.join(", ")}',
      );
    }
  }
}