import 'package:flutter/material.dart';

import '../../domain/recommendation_response.dart';
import '../widgets/neptune_recommendation_card.dart';

class RecommendationDetailsPage extends StatelessWidget {
  final RecommendationResponse recommendation;

  const RecommendationDetailsPage({
    super.key,
    required this.recommendation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Neptune Recommendation',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: NeptuneRecommendationCard(
            recommendation: recommendation,
          ),
        ),
      ),
    );
  }
}