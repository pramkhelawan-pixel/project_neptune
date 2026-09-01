import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/recommendation/domain/recommendation_response.dart';
import 'package:project_neptune/features/recommendation/presentation/pages/recommendation_details_page.dart';

void main() {
  // Regression test for the Recommendation Details semantic bug: the
  // "Environmental Readiness" card must reflect RecommendationResponse.score
  // (the raw environmental condition-match count), not
  // RecommendationResponse.confidence (a separate, lookup-derived value
  // already shown on the Neptune Recommendation card below it). Before the
  // fix, both cards displayed numbers and labels derived from the exact
  // same `confidence` figure, appearing to be two independent
  // corroborating assessments when they were not.

  const response = RecommendationResponse(
    species: 'Shad',
    bait: 'Sardine',
    hook: '4/0 circle hook',
    leader: '40lb mono',
    presentation: 'Live bait',
    location: 'Test Beach',
    bestTime: 'Sunrise',
    confidence: 80, // ConfidenceEngine's bucket for a score of 60
    score: 60, // the actual raw environmental match count
    explanations: ['Water temperature supports feeding activity'],
  );

  testWidgets(
    'Environmental Readiness shows the raw score (60%, Good), not the '
    'confidence value (80%, Very Good) redisplayed under a second label',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: RecommendationDetailsPage(recommendation: response),
        ),
      );
      await tester.pump();

      // The score-derived reading (correct, post-fix).
      expect(find.text('60%'), findsOneWidget);
      expect(find.text('Good'), findsOneWidget);

      // The confidence-derived reading the bug would have shown here
      // instead must NOT appear on the Environmental Readiness card.
      expect(find.text('Very Good'), findsNothing);
    },
  );
}
