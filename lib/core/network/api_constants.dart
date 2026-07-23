class ApiConstants {
  const ApiConstants._();

  // ===========================================================================
  // Open-Meteo
  // ===========================================================================

  static const String marineBaseUrl =
      'https://marine-api.open-meteo.com/v1';

  static const String weatherBaseUrl =
      'https://api.open-meteo.com/v1';

  // ===========================================================================
  // Stormglass
  // ===========================================================================

  static const String stormglassBaseUrl =
      'https://api.stormglass.io/v2';

  // ===========================================================================
  // Endpoints
  // ===========================================================================

  static const String marineForecast = '/marine';

  static const String weatherForecast = '/forecast';

  // ===========================================================================
  // Durban Harbour (Sprint 14A)
  // ===========================================================================

  static const double durbanLatitude = -29.8716;
  static const double durbanLongitude = 31.0464;

  // ===========================================================================
  // Network
  // ===========================================================================

  static const Duration connectionTimeout =
  Duration(seconds: 15);

  static const Duration receiveTimeout =
  Duration(seconds: 15);

  static const Duration sendTimeout =
  Duration(seconds: 15);
}