import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/core/theme/app_theme.dart';
import 'package:project_neptune/features/marine/domain/enums/tide_state.dart';
import 'package:project_neptune/features/recommendation/presentation/widgets/best_fishing_window_card.dart';
import 'package:project_neptune/features/recommendation/services/best_fishing_window_engine.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(
        theme: AppTheme.neptune,
        home: Scaffold(body: child),
      );

  testWidgets('renders the formatted window, qualitative level, and reasons', (
    tester,
  ) async {
    final candidate = BestFishingWindowCandidate(
      start: DateTime(2026, 1, 1, 5, 40),
      end: DateTime(2026, 1, 1, 8, 15),
      anchorTideState: TideState.high,
      score: 80,
      qualitativeLevel: 'Very Good',
      reasons: const ['Tide matches preferred conditions.'],
    );

    await tester.pumpWidget(
      wrap(
        BestFishingWindowCard(
          result: BestFishingWindowResult(best: candidate, candidates: [candidate]),
        ),
      ),
    );

    expect(find.textContaining('05:40'), findsOneWidget);
    expect(find.textContaining('08:15'), findsOneWidget);
    expect(find.text('Very Good'), findsOneWidget);
    expect(find.text('Tide matches preferred conditions.'), findsOneWidget);
  });

  testWidgets('renders an empty state when no window is available', (tester) async {
    await tester.pumpWidget(
      wrap(
        const BestFishingWindowCard(
          result: BestFishingWindowResult(best: null, candidates: []),
        ),
      ),
    );

    expect(find.textContaining('No suitable fishing window'), findsOneWidget);
  });
}
