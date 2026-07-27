import '../domain/recommendation_request.dart';

class RecommendationSeed {
  final String bait;
  final String bestTime;
  final List<int> weights;
  final List<String> reasons;

  const RecommendationSeed({
    required this.bait,
    required this.bestTime,
    required this.weights,
    required this.reasons,
  });
}

class RecommendationSeedProvider {
  const RecommendationSeedProvider();

  RecommendationSeed getSeed(
      RecommendationRequest request,
      ) {
    // Future versions will derive these values from:
    // - Knowledge Packs
    // - Rule Engine
    // - Location Intelligence
    // - Species Intelligence
    // - Marine Conditions

    return const RecommendationSeed(
      bait: 'Fresh Sardine',
      bestTime: 'Sunrise',
      weights: <int>[
        15,
        20,
        18,
      ],
      reasons: <String>[
        'Incoming tide',
        'Moderate swell',
        'Light offshore wind',
      ],
    );
  }
}