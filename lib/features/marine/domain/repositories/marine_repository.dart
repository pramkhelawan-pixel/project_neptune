import '../models/marine_conditions.dart';

abstract class MarineRepository {
  const MarineRepository();

  Future<MarineConditions> getMarineConditions();
}