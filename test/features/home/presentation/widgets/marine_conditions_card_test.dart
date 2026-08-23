import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/home/presentation/widgets/marine_conditions_card.dart';
import 'package:project_neptune/features/lunar/domain/solunar_period.dart';
import 'package:project_neptune/features/marine/domain/models/marine_conditions.dart';
import 'package:project_neptune/features/profile/domain/entities/profile.dart';
import 'package:project_neptune/features/profile/domain/repositories/profile_repository.dart';
import 'package:project_neptune/features/profile/presentation/providers/profile_repository_provider.dart';

/// Returns a canned (or never-completing, or throwing) profile lookup
/// instead of touching Supabase, so every entitlement outcome can be
/// tested without a real backend.
class _FakeProfileRepository implements ProfileRepository {
  _FakeProfileRepository(this._getCurrentProfile);

  final Future<Profile?> Function() _getCurrentProfile;

  @override
  Future<Profile?> getCurrentProfile() => _getCurrentProfile();

  @override
  Future<void> deleteAccount() => throw UnimplementedError();
}

ProfileRepository _premiumProfile() => _FakeProfileRepository(
      () async => Profile(
        id: 'user-1',
        isPremium: true,
        createdAt: DateTime(2026, 1, 1),
      ),
    );

ProfileRepository _freeProfile() => _FakeProfileRepository(
      () async => Profile(
        id: 'user-1',
        isPremium: false,
        createdAt: DateTime(2026, 1, 1),
      ),
    );

ProfileRepository _nullProfile() =>
    _FakeProfileRepository(() async => null);

/// A Future that deliberately never completes, so `currentProfileProvider`
/// stays in `AsyncValue.loading()` for the lifetime of the test.
ProfileRepository _loadingProfile() =>
    _FakeProfileRepository(() => Completer<Profile?>().future);

ProfileRepository _erroringProfile() => _FakeProfileRepository(
      () async => throw Exception('profile lookup failed'),
    );

MarineConditions _conditions({
  DateTime? observedAt,
  DateTime? moonrise,
  DateTime? moonset,
  List<SolunarPeriod> majorPeriods = const [],
  List<SolunarPeriod> minorPeriods = const [],
}) {
  return MarineConditions(
    windSpeed: 10,
    windDirection: 'SW',
    swellHeight: 1.2,
    swellPeriod: 7.0,
    waterTemperature: 16.0,
    airTemperature: 22.0,
    atmosphericPressure: 1015,
    // Pinned to a real (non-null) value so these rows never render the
    // fixture's own "--" and get confused with the Solunar rows under
    // test below.
    precipitation: 0,
    precipitationProbability: 0,
    tideHeight: 1.1,
    tideState: 'Incoming',
    nextHighTide: DateTime(2026, 1, 1, 18),
    nextLowTide: DateTime(2026, 1, 1, 6),
    moonPhase: 'Full Moon',
    sunrise: DateTime(2026, 1, 1, 5, 30),
    sunset: DateTime(2026, 1, 1, 19, 30),
    moonrise: moonrise,
    moonset: moonset,
    majorPeriods: majorPeriods,
    minorPeriods: minorPeriods,
    observedAt: observedAt,
  );
}

Widget _harness({
  required MarineConditions conditions,
  required ProfileRepository profileRepository,
}) {
  return ProviderScope(
    overrides: [
      profileRepositoryProvider.overrideWithValue(profileRepository),
    ],
    child: MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: MarineConditionsCard(conditions: conditions),
        ),
      ),
    ),
  );
}

void main() {
  group('MarineConditionsCard - freshness indicator', () {
    testWidgets('a recent observation shows "Last updated" phrasing', (
      tester,
    ) async {
      final conditions = _conditions(
        observedAt: DateTime.now().subtract(const Duration(minutes: 2)),
      );

      await tester.pumpWidget(
        _harness(
          conditions: conditions,
          profileRepository: _premiumProfile(),
        ),
      );
      await tester.pump();

      expect(find.textContaining('Last updated'), findsOneWidget);
      expect(find.textContaining('last known conditions'), findsNothing);
    });

    testWidgets(
      'a stale observation shows the "last known conditions" phrasing with '
      'an age, distinct from the fresh phrasing',
      (tester) async {
        final conditions = _conditions(
          observedAt: DateTime.now().subtract(const Duration(hours: 7)),
        );

        await tester.pumpWidget(
          _harness(
            conditions: conditions,
            profileRepository: _premiumProfile(),
          ),
        );
        await tester.pump();

        expect(
          find.textContaining('Using last known conditions'),
          findsOneWidget,
        );
        expect(find.textContaining('old'), findsOneWidget);
        expect(find.textContaining('Last updated'), findsNothing);
      },
    );

    testWidgets(
      'an unknown observation time shows the last-known-conditions '
      'phrasing without fabricating an age',
      (tester) async {
        final conditions = _conditions();

        await tester.pumpWidget(
          _harness(
            conditions: conditions,
            profileRepository: _premiumProfile(),
          ),
        );
        await tester.pump();

        expect(
          find.text('Using last known conditions'),
          findsOneWidget,
        );
      },
    );
  });

  group('MarineConditionsCard - Solunar (Premium user)', () {
    testWidgets('displays real moonrise/moonset times and the row labels',
        (tester) async {
      final conditions = _conditions(
        moonrise: DateTime(2026, 1, 1, 6, 12),
        moonset: DateTime(2026, 1, 1, 18, 47),
      );

      await tester.pumpWidget(
        _harness(
          conditions: conditions,
          profileRepository: _premiumProfile(),
        ),
      );
      await tester.pump();

      expect(find.text('Moonrise'), findsOneWidget);
      expect(find.text('06:12'), findsOneWidget);
      expect(find.text('Moonset'), findsOneWidget);
      expect(find.text('18:47'), findsOneWidget);
    });

    testWidgets('an unavailable moonrise/moonset shows "--" rather than a '
        'fabricated time', (tester) async {
      // Major/minor periods deliberately populated here so their own
      // (unrelated) "--" rendering can't be confused with the
      // moonrise/moonset assertion below.
      final conditions = _conditions(
        majorPeriods: [
          SolunarPeriod(
            start: DateTime(2026, 1, 1, 11),
            end: DateTime(2026, 1, 1, 13),
          ),
        ],
        minorPeriods: [
          SolunarPeriod(
            start: DateTime(2026, 1, 1, 5),
            end: DateTime(2026, 1, 1, 7),
          ),
        ],
      );

      await tester.pumpWidget(
        _harness(
          conditions: conditions,
          profileRepository: _premiumProfile(),
        ),
      );
      await tester.pump();

      expect(find.text('Moonrise'), findsOneWidget);
      expect(find.text('Moonset'), findsOneWidget);
      expect(find.text('--'), findsNWidgets(2));
    });

    testWidgets('displays major feeding periods as start-end ranges',
        (tester) async {
      final conditions = _conditions(
        majorPeriods: [
          SolunarPeriod(
            start: DateTime(2026, 1, 1, 11),
            end: DateTime(2026, 1, 1, 13),
          ),
          SolunarPeriod(
            start: DateTime(2026, 1, 1, 23),
            end: DateTime(2026, 1, 2, 1),
          ),
        ],
      );

      await tester.pumpWidget(
        _harness(
          conditions: conditions,
          profileRepository: _premiumProfile(),
        ),
      );
      await tester.pump();

      expect(find.text('Major Periods'), findsOneWidget);
      expect(find.text('11:00–13:00, 23:00–01:00'), findsOneWidget);
    });

    testWidgets('displays minor feeding periods as start-end ranges',
        (tester) async {
      final conditions = _conditions(
        minorPeriods: [
          SolunarPeriod(
            start: DateTime(2026, 1, 1, 5, 12),
            end: DateTime(2026, 1, 1, 7, 12),
          ),
        ],
      );

      await tester.pumpWidget(
        _harness(
          conditions: conditions,
          profileRepository: _premiumProfile(),
        ),
      );
      await tester.pump();

      expect(find.text('Minor Periods'), findsOneWidget);
      expect(find.text('05:12–07:12'), findsOneWidget);
    });

    testWidgets('an empty major/minor periods list shows "--", never a '
        'fabricated window', (tester) async {
      final conditions = _conditions();

      await tester.pumpWidget(
        _harness(
          conditions: conditions,
          profileRepository: _premiumProfile(),
        ),
      );
      await tester.pump();

      expect(find.text('Major Periods'), findsOneWidget);
      expect(find.text('Minor Periods'), findsOneWidget);
      // '--' also appears for Moonrise/Moonset in this fixture (both
      // unset), so four occurrences total.
      expect(find.text('--'), findsNWidgets(4));
    });

    testWidgets('does not show the locked Premium row', (tester) async {
      final conditions = _conditions();

      await tester.pumpWidget(
        _harness(
          conditions: conditions,
          profileRepository: _premiumProfile(),
        ),
      );
      await tester.pump();

      expect(find.text('Solunar Intelligence — Premium'), findsNothing);
    });
  });

  group('MarineConditionsCard - Solunar gating (Free / locked users)', () {
    testWidgets('a free user does not see Moonrise, Moonset, Major Periods, '
        'or Minor Periods, and sees the locked row instead', (tester) async {
      final conditions = _conditions(
        moonrise: DateTime(2026, 1, 1, 6, 12),
        moonset: DateTime(2026, 1, 1, 18, 47),
        majorPeriods: [
          SolunarPeriod(
            start: DateTime(2026, 1, 1, 11),
            end: DateTime(2026, 1, 1, 13),
          ),
        ],
        minorPeriods: [
          SolunarPeriod(
            start: DateTime(2026, 1, 1, 5),
            end: DateTime(2026, 1, 1, 7),
          ),
        ],
      );

      await tester.pumpWidget(
        _harness(
          conditions: conditions,
          profileRepository: _freeProfile(),
        ),
      );
      await tester.pump();

      expect(find.text('Moonrise'), findsNothing);
      expect(find.text('Moonset'), findsNothing);
      expect(find.text('Major Periods'), findsNothing);
      expect(find.text('Minor Periods'), findsNothing);
      expect(find.text('Solunar Intelligence — Premium'), findsOneWidget);
    });

    testWidgets('a null profile (no row yet) behaves as free/locked',
        (tester) async {
      final conditions = _conditions(
        moonrise: DateTime(2026, 1, 1, 6, 12),
        moonset: DateTime(2026, 1, 1, 18, 47),
      );

      await tester.pumpWidget(
        _harness(
          conditions: conditions,
          profileRepository: _nullProfile(),
        ),
      );
      await tester.pump();

      expect(find.text('Moonrise'), findsNothing);
      expect(find.text('Moonset'), findsNothing);
      expect(find.text('Solunar Intelligence — Premium'), findsOneWidget);
    });

    testWidgets('a still-loading profile behaves as free/locked',
        (tester) async {
      final conditions = _conditions(
        moonrise: DateTime(2026, 1, 1, 6, 12),
        moonset: DateTime(2026, 1, 1, 18, 47),
      );

      await tester.pumpWidget(
        _harness(
          conditions: conditions,
          profileRepository: _loadingProfile(),
        ),
      );
      // Deliberately a single pump, not pumpAndSettle: the fake repository
      // never resolves, so the provider must still be AsyncValue.loading
      // here.
      await tester.pump();

      expect(find.text('Moonrise'), findsNothing);
      expect(find.text('Moonset'), findsNothing);
      expect(find.text('Solunar Intelligence — Premium'), findsOneWidget);
    });

    testWidgets('a failed profile lookup behaves as free/locked, never '
        'crashing the card', (tester) async {
      final conditions = _conditions(
        moonrise: DateTime(2026, 1, 1, 6, 12),
        moonset: DateTime(2026, 1, 1, 18, 47),
      );

      await tester.pumpWidget(
        _harness(
          conditions: conditions,
          profileRepository: _erroringProfile(),
        ),
      );
      await tester.pump();

      expect(find.text('Moonrise'), findsNothing);
      expect(find.text('Moonset'), findsNothing);
      expect(find.text('Solunar Intelligence — Premium'), findsOneWidget);
    });

    testWidgets('the Moon Phase row remains visible for a free user',
        (tester) async {
      final conditions = _conditions();

      await tester.pumpWidget(
        _harness(
          conditions: conditions,
          profileRepository: _freeProfile(),
        ),
      );
      await tester.pump();

      expect(find.text('Moon'), findsOneWidget);
      expect(find.text('Full Moon'), findsOneWidget);
    });

    testWidgets('non-Solunar rows (Wind, Rain, Swell, Tide, Sunrise, '
        'Sunset) remain visible for a free user', (tester) async {
      final conditions = _conditions();

      await tester.pumpWidget(
        _harness(
          conditions: conditions,
          profileRepository: _freeProfile(),
        ),
      );
      await tester.pump();

      expect(find.text('Wind'), findsOneWidget);
      expect(find.text('Rainfall'), findsOneWidget);
      expect(find.text('Rain Chance'), findsOneWidget);
      expect(find.text('Swell'), findsOneWidget);
      expect(find.text('Tide'), findsOneWidget);
      expect(find.text('Current Height'), findsOneWidget);
      expect(find.text('Next High'), findsOneWidget);
      expect(find.text('Next Low'), findsOneWidget);
      expect(find.text('Sunrise'), findsOneWidget);
      expect(find.text('Sunset'), findsOneWidget);
    });

    testWidgets(
      'Solunar data is not removed from MarineConditions for a free user '
      '- the underlying calculation/data path is identical regardless of '
      'entitlement, only the UI row is gated',
      (tester) async {
        final conditions = _conditions(
          moonrise: DateTime(2026, 1, 1, 6, 12),
          moonset: DateTime(2026, 1, 1, 18, 47),
          majorPeriods: [
            SolunarPeriod(
              start: DateTime(2026, 1, 1, 11),
              end: DateTime(2026, 1, 1, 13),
            ),
          ],
        );

        // The gate is purely a UI rendering decision inside
        // MarineConditionsCard - the MarineConditions object handed to it
        // (i.e. the output of the repository/mapper layer) is completely
        // unaffected by entitlement, and still carries the real values.
        expect(conditions.moonrise, DateTime(2026, 1, 1, 6, 12));
        expect(conditions.moonset, DateTime(2026, 1, 1, 18, 47));
        expect(conditions.majorPeriods, hasLength(1));

        await tester.pumpWidget(
          _harness(
            conditions: conditions,
            profileRepository: _freeProfile(),
          ),
        );
        await tester.pump();

        // Locked in the UI...
        expect(find.text('Moonrise'), findsNothing);
        // ...but the data it would have rendered was never discarded.
        expect(conditions.moonrise, isNotNull);
      },
    );
  });
}
