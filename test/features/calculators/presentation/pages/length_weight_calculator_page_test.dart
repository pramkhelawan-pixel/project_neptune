import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/calculators/presentation/calculator_copy.dart';
import 'package:project_neptune/features/calculators/presentation/pages/length_weight_calculator_page.dart';
import 'package:project_neptune/features/profile/domain/entities/profile.dart';
import 'package:project_neptune/features/profile/domain/repositories/profile_repository.dart';
import 'package:project_neptune/features/profile/presentation/providers/profile_repository_provider.dart';

/// Mirrors the harness pattern already used by
/// test/features/licence/presentation/pages/licence_page_test.dart -- a
/// fake ProfileRepository is the only override needed to exercise
/// currentProfileProvider, proving no Supabase client or network call is
/// ever constructed by this page.
class _FakeProfileRepository implements ProfileRepository {
  _FakeProfileRepository(this._getCurrentProfile);

  final Future<Profile?> Function() _getCurrentProfile;

  @override
  Future<Profile?> getCurrentProfile() => _getCurrentProfile();

  @override
  Future<void> deleteAccount() => throw UnimplementedError();
}

Widget harness({required bool isPremium}) {
  return ProviderScope(
    overrides: [
      profileRepositoryProvider.overrideWithValue(
        _FakeProfileRepository(
          () async => Profile(
            id: 'user-1',
            isPremium: isPremium,
            createdAt: DateTime(2026, 1, 1),
          ),
        ),
      ),
    ],
    child: const MaterialApp(home: LengthWeightCalculatorPage()),
  );
}

/// currentProfileProvider is a single FutureProvider here (no chained
/// entitlement provider, unlike Licence) so one pump is enough to settle
/// it -- pumpAndSettle is avoided for the same reason noted in
/// licence_page_test.dart.
Future<void> pumpUntilResolved(WidgetTester tester) async {
  await tester.pump();
  await tester.pump();
}

void main() {
  group('LengthWeightCalculatorPage - Free / locked', () {
    testWidgets('shows a Premium-required message, not the calculator form',
        (tester) async {
      await tester.pumpWidget(harness(isPremium: false));
      await pumpUntilResolved(tester);

      expect(
        find.text('$kLengthWeightCalculatorName is a Premium feature.'),
        findsOneWidget,
      );
      expect(find.text('Calculate'), findsNothing);
      expect(find.byType(TextFormField), findsNothing);
    });

    testWidgets('still shows the feature name in the app bar while locked',
        (tester) async {
      await tester.pumpWidget(harness(isPremium: false));
      await pumpUntilResolved(tester);

      expect(find.text(kLengthWeightCalculatorName), findsOneWidget);
    });
  });

  group('LengthWeightCalculatorPage - Premium, initial state', () {
    testWidgets('shows the form: species, length, unit toggle, Calculate',
        (tester) async {
      await tester.pumpWidget(harness(isPremium: true));
      await pumpUntilResolved(tester);

      expect(find.text(kLengthWeightCalculatorSubtitle), findsOneWidget);
      expect(find.text('Cape Stumpnose'), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('cm'), findsOneWidget);
      expect(find.text('in'), findsOneWidget);
      expect(find.text('Calculate'), findsOneWidget);
      expect(find.text('Measurement: Standard Length (SL)'), findsOneWidget);
    });

    testWidgets('shows the required SL-not-TL disclaimer, the scientific '
        'disclaimer, and the Harrison (2001) source attribution',
        (tester) async {
      await tester.pumpWidget(harness(isPremium: true));
      await pumpUntilResolved(tester);

      expect(find.text(kLengthWeightMeasurementDisclaimer), findsOneWidget);
      expect(find.text(kLengthWeightScientificDisclaimer), findsOneWidget);
      expect(find.text(kLengthWeightSourceAttribution), findsOneWidget);
      expect(find.textContaining('Harrison'), findsOneWidget);
      expect(find.textContaining('2001'), findsOneWidget);
      expect(
        find.textContaining('10.1046/j.1439-0426.2001.00277.x'),
        findsOneWidget,
      );
    });

    testWidgets('does not show a result before Calculate is pressed',
        (tester) async {
      await tester.pumpWidget(harness(isPremium: true));
      await pumpUntilResolved(tester);

      expect(find.textContaining('Estimated weight'), findsNothing);
    });
  });

  group('LengthWeightCalculatorPage - valid calculation', () {
    testWidgets('cm input produces the correct estimated weight for the '
        'default species (Cape Stumpnose)', (tester) async {
      await tester.pumpWidget(harness(isPremium: true));
      await pumpUntilResolved(tester);

      await tester.enterText(find.byType(TextFormField), '15');
      await tester.tap(find.text('Calculate'));
      await tester.pump();

      // a=0.0272, b=3.087, L=15cm -> 0.1161883597kg
      expect(find.text('Estimated weight: 0.12 kg'), findsOneWidget);
    });

    testWidgets('inch input is converted to cm before the equation is '
        'applied', (tester) async {
      await tester.pumpWidget(harness(isPremium: true));
      await pumpUntilResolved(tester);

      await tester.tap(find.text('in'));
      await tester.pump();

      await tester.enterText(find.byType(TextFormField), '5');
      await tester.tap(find.text('Calculate'));
      await tester.pump();

      // 5in = 12.7cm; a=0.0272, b=3.087 -> 0.069504kg
      expect(find.text('Estimated weight: 0.07 kg'), findsOneWidget);
    });

    testWidgets('selecting a different species (Spotted Grunter) uses that '
        "species' coefficients", (tester) async {
      await tester.pumpWidget(harness(isPremium: true));
      await pumpUntilResolved(tester);

      await tester.tap(find.text('Cape Stumpnose'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Spotted Grunter').last);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField), '10');
      await tester.tap(find.text('Calculate'));
      await tester.pump();

      // Grunter a=0.0209, b=3.001, L=10cm -> 0.02094818kg
      expect(find.text('Estimated weight: 0.02 kg'), findsOneWidget);
    });
  });

  group('LengthWeightCalculatorPage - invalid input', () {
    testWidgets('empty length shows an invalid-length message, no weight',
        (tester) async {
      await tester.pumpWidget(harness(isPremium: true));
      await pumpUntilResolved(tester);

      await tester.tap(find.text('Calculate'));
      await tester.pump();

      expect(
        find.text('Enter a valid length greater than zero.'),
        findsOneWidget,
      );
      expect(find.textContaining('Estimated weight'), findsNothing);
    });

    testWidgets('zero length shows an invalid-length message, no weight',
        (tester) async {
      await tester.pumpWidget(harness(isPremium: true));
      await pumpUntilResolved(tester);

      await tester.enterText(find.byType(TextFormField), '0');
      await tester.tap(find.text('Calculate'));
      await tester.pump();

      expect(
        find.text('Enter a valid length greater than zero.'),
        findsOneWidget,
      );
    });

    testWidgets('negative length shows an invalid-length message, no '
        'weight', (tester) async {
      await tester.pumpWidget(harness(isPremium: true));
      await pumpUntilResolved(tester);

      await tester.enterText(find.byType(TextFormField), '-5');
      await tester.tap(find.text('Calculate'));
      await tester.pump();

      expect(
        find.text('Enter a valid length greater than zero.'),
        findsOneWidget,
      );
    });

    testWidgets('non-numeric text shows an invalid-length message, no '
        'weight', (tester) async {
      await tester.pumpWidget(harness(isPremium: true));
      await pumpUntilResolved(tester);

      await tester.enterText(find.byType(TextFormField), 'abc');
      await tester.tap(find.text('Calculate'));
      await tester.pump();

      expect(
        find.text('Enter a valid length greater than zero.'),
        findsOneWidget,
      );
    });
  });

  group('LengthWeightCalculatorPage - range validation, no extrapolation',
      () {
    testWidgets('a length above the validated range shows a warning and '
        'no weight, for the default species (Cape Stumpnose, max 24cm)',
        (tester) async {
      await tester.pumpWidget(harness(isPremium: true));
      await pumpUntilResolved(tester);

      await tester.enterText(find.byType(TextFormField), '50');
      await tester.tap(find.text('Calculate'));
      await tester.pump();

      expect(
        find.textContaining('outside the validated study range'),
        findsOneWidget,
      );
      expect(find.textContaining('Estimated weight'), findsNothing);
    });

    testWidgets('a length below the validated range shows a warning and '
        'no weight', (tester) async {
      await tester.pumpWidget(harness(isPremium: true));
      await pumpUntilResolved(tester);

      await tester.enterText(find.byType(TextFormField), '0.5');
      await tester.tap(find.text('Calculate'));
      await tester.pump();

      expect(
        find.textContaining('outside the validated study range'),
        findsOneWidget,
      );
      expect(find.textContaining('Estimated weight'), findsNothing);
    });
  });
}
