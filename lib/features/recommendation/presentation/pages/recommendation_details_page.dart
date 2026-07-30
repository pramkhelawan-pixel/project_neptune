import 'package:flutter/material.dart';

import '../../domain/recommendation_response.dart';
import '../../services/environmental_readiness_calculator.dart';
import '../widgets/environmental_breakdown_card.dart';
import '../widgets/environmental_readiness_card.dart';
import '../widgets/neptune_recommendation_card.dart';

class RecommendationDetailsPage extends StatelessWidget {
  final RecommendationResponse recommendation;

  const RecommendationDetailsPage({
    super.key,
    required this.recommendation,
  });

  @override
  Widget build(BuildContext context) {
    final readiness =
    const EnvironmentalReadinessCalculator().calculate(
      environmentalScore: recommendation.confidence.round(),
      reasons: recommendation.explanations,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Neptune Intelligence',
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            EnvironmentalReadinessCard(
              readiness: readiness,
            ),

            const SizedBox(height: 20),

            EnvironmentalBreakdownCard(
              readiness: readiness,
            ),

            const SizedBox(height: 20),

            NeptuneRecommendationCard(
              recommendation: recommendation,
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}