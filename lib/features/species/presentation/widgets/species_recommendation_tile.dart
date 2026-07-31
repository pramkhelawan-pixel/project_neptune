import 'package:flutter/material.dart';

import '../models/species_recommendation_view_model.dart';

class SpeciesRecommendationTile extends StatelessWidget {
  final SpeciesRecommendationViewModel recommendation;

  const SpeciesRecommendationTile({
    super.key,
    required this.recommendation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            '${recommendation.score}',
          ),
        ),
        title: Text(
          recommendation.speciesName,
        ),
        subtitle: Text(
          recommendation.recommended
              ? 'Recommended Today'
              : 'Conditions Less Favourable',
        ),
        trailing: const Icon(
          Icons.chevron_right,
        ),
      ),
    );
  }
}