class ApiConstants {
  const ApiConstants._();

  // ---------------------------------------------------------------------------
  // Open-Meteo
  // ---------------------------------------------------------------------------

  static const String openMeteoBaseUrl =
      'https://marine-api.open-meteo.com/v1';

  // ---------------------------------------------------------------------------
  // Stormglass
  // ---------------------------------------------------------------------------

  static const String stormglassBaseUrl =
      'https://api.stormglass.io/v2';

  // ---------------------------------------------------------------------------
  // Timeouts
  // ---------------------------------------------------------------------------

  static const Duration connectionTimeout =
  Duration(seconds: 15);

  static const Duration receiveTimeout =
  Duration(seconds: 15);

  static const Duration sendTimeout =
  Duration(seconds: 15);

  // ---------------------------------------------------------------------------
  // API Routes
  // ---------------------------------------------------------------------------

  static const String marineForecast =
      '/marine';

  static const String weatherPoint =
      '/weather/point';
}