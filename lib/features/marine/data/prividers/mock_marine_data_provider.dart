import '../../domain/models/marine_conditions.dart';
import '../../domain/providers/marine_data_provider.dart';

class MockMarineDataProvider implements MarineDataProvider {
  const MockMarineDataProvider();

  @override
  Future<MarineConditions> getMarineConditions({
    required double latitude,
    required double longitude,
  }) async {
    return MarineConditions(
      windSpeed: 14.5,
      windDirection: 'SW',

      swellHeight: 1.2,
      swellPeriod: 11.0,

      waterTemperature: 20.0,

      // Air temperature (°C)
      airTemperature: 23.5,

      // Atmospheric pressure (hPa)
      atmosphericPressure: 1016.5,

      tide: 'Incoming',
      tideHeight: 1.7,

      nextHighTide: DateTime.now().add(
        const Duration(hours: 2),
      ),

      nextLowTide: DateTime.now().add(
        const Duration(hours: 8),
      ),

      tideState: 'Incoming',

      moonPhase: 'New',

      sunrise: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        5,
        42,
      ),

      sunset: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        18,
        11,
      ),
    );
  }
}