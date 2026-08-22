import '../../knowledge/domain/enums/knowledge_category.dart';
import '../../knowledge/services/knowledge_service.dart';

import '../data/species_environment_profiles.dart';
import '../domain/recommendation_request.dart';
import '../domain/species_environment_profile.dart';
import 'environmental_evaluator.dart';

class RecommendationSeed {
  final String bait;
  final String hook;
  final String leader;
  final String presentation;
  final String bestTime;
  final int environmentalScore;
  final List<String> reasons;

  const RecommendationSeed({
    required this.bait,
    required this.hook,
    required this.leader,
    required this.presentation,
    required this.bestTime,
    required this.environmentalScore,
    required this.reasons,
  });
}

class RecommendationSeedProvider {
  final KnowledgeService? knowledgeService;

  final EnvironmentalEvaluator _environmentalEvaluator =
  const EnvironmentalEvaluator();

  const RecommendationSeedProvider({
    this.knowledgeService,
  });

  Future<RecommendationSeed> getSeed(
      RecommendationRequest request,
      ) async {
    final bait = await knowledgeService?.bestKnowledge(
      species: request.species,
      category: KnowledgeCategory.bait,
    );

    final hook = await knowledgeService?.bestKnowledge(
      species: request.species,
      category: KnowledgeCategory.hook,
    );

    final leader = await knowledgeService?.bestKnowledge(
      species: request.species,
      category: KnowledgeCategory.leader,
    );

    final presentation = await knowledgeService?.bestKnowledge(
      species: request.species,
      category: KnowledgeCategory.presentation,
    );

    final profile = _profileForSpecies(request.species);

    final evaluation = _environmentalEvaluator.evaluate(
      profile: profile,
      conditions: request.marineConditions,
    );

    return RecommendationSeed(
      bait: bait?.title ?? 'No bait available',
      hook: hook?.title ?? 'No hook available',
      leader: leader?.title ?? 'No leader available',
      presentation: presentation?.title ?? 'No presentation available',
      bestTime: 'Sunrise',
      environmentalScore: evaluation.score,
      reasons: evaluation.reasons,
    );
  }

  SpeciesEnvironmentProfile _profileForSpecies(
      String species,
      ) {
    return environmentProfiles.firstWhere(
          (profile) =>
      profile.species.toLowerCase() == species.toLowerCase(),
      orElse: () => shadEnvironmentProfile,
    );
  }
}