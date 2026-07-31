import 'package:flutter/material.dart';

import '../models/species_recommendation_view_model.dart';
import '../widgets/species_recommendation_tile.dart';

class DailyRecommendationPage extends StatelessWidget {
  const DailyRecommendationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Today's Fishing",
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          SpeciesRecommendationTile(
            recommendation: SpeciesRecommendationViewModel(
              speciesName: 'Kob',
              score: 94,
              recommended: true,
            ),
          ),
          SizedBox(height: 12),
          SpeciesRecommendationTile(
            recommendation: SpeciesRecommendationViewModel(
              speciesName: 'Garrick',
              score: 82,
              recommended: true,
            ),
          ),
        ],
      ),
    );
  }
}