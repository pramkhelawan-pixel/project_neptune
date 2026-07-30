import '../models/marine_conditions.dart';

abstract class MarineDataProvider {
  const MarineDataProvider();

  Future<MarineConditions> getMarineConditions({
    required double latitude,
    required double longitude,
  });
}