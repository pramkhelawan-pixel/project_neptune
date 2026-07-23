import '../../domain/models/marine_conditions.dart';

/// Defines how marine data is retrieved from a remote source.
///
/// The repository depends on this abstraction rather than a specific API.
/// Today it returns mock data; later it will call Stormglass,
/// Open-Meteo and other services.
abstract class MarineRemoteDataSource {
  Future<MarineConditions> getMarineConditions();
}

/// Temporary implementation using mock data.
///
/// This allows the rest of the architecture to remain unchanged while
/// we prepare the live API integration.
class MockMarineRemoteDataSource implements MarineRemoteDataSource {
  const MockMarineRemoteDataSource();

  @override
  Future<MarineConditions> getMarineConditions() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return MarineConditions(
      windSpeed: 14,
      windDirection: 'NE',
      swellHeight: 1.8,
      swellPeriod: 12,
      tide: 'Rising',
      moonPhase: 'Waxing Gibbous',
      sunrise: DateTime(2026, 7, 23, 6, 21),
      sunset: DateTime(2026, 7, 23, 17, 18),
    );
  }
}