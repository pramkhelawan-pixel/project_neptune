import '../../marine/domain/models/marine_conditions.dart';

class RecommendationRequest {
  final MarineConditions marineConditions;

  final String species;

  final String location;

  const RecommendationRequest({
    required this.marineConditions,
    required this.species,
    required this.location,
  });
}