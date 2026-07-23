import '../../domain/models/marine_conditions.dart';
import '../../domain/repositories/marine_repository.dart';

class MarineRepositoryImpl implements MarineRepository {
  const MarineRepositoryImpl();

  @override
  Future<MarineConditions> getMarineConditions() async {
    // Simulate a network request
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