import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/catches/data/models/catch_dto.dart';
import 'package:project_neptune/features/catches/domain/entities/catch_record.dart';
import 'package:project_neptune/features/catches/domain/repositories/catch_repository.dart';
import 'package:project_neptune/features/catches/presentation/providers/catch_provider.dart';
import 'package:project_neptune/features/catches/presentation/providers/log_catch_controller.dart';
import 'package:project_neptune/features/session/data/models/fishing_session_dto.dart';
import 'package:project_neptune/features/marine/domain/models/marine_conditions.dart';
import 'package:project_neptune/features/marine/presentation/providers/marine_provider.dart';
import 'package:project_neptune/features/session/domain/entities/fishing_session.dart';
import 'package:project_neptune/features/session/domain/entities/session_status.dart';
import 'package:project_neptune/features/session/domain/repositories/fishing_session_repository.dart';
import 'package:project_neptune/features/session/presentation/providers/fishing_session_repository_provider.dart';

class _RecordingCatchRepository implements CatchRepository {
  final List<CatchRecord> saved = [];

  @override
  Future<void> save(CatchRecord record) async => saved.add(record);

  @override
  Future<List<CatchRecord>> getAll() async => saved;

  @override
  Future<void> delete(String id) async {}

  @override
  Future<List<CatchRecord>> getBySpecies(String species) async => [];

  @override
  Future<List<CatchRecord>> getByLocation(String location) async => [];
}

class _RecordingSessionRepository implements FishingSessionRepository {
  final List<FishingSession> saved = [];

  @override
  Future<void> save(FishingSession session) async => saved.add(session);

  @override
  Future<List<FishingSession>> getAll() async => saved;

  @override
  Future<FishingSession?> getById(String id) async =>
      saved.where((s) => s.id == id).firstOrNull;

  @override
  Future<void> delete(String id) async {}

  @override
  Future<FishingSession?> getActiveSession() async =>
      saved.where((s) => s.isActive).firstOrNull;
}

MarineConditions _conditions() {
  return MarineConditions(
    windSpeed: 20.2,
    windDirection: 'SW',
    swellHeight: 1.5,
    swellPeriod: 7.2,
    swellDirection: 'SW',
    waterTemperature: 21.7,
    airTemperature: 18.4,
    atmosphericPressure: 1027.3,
    precipitation: 0.2,
    precipitationProbability: 97.0,
    tideHeight: -0.34,
    tideState: 'Outgoing',
    nextHighTide: DateTime.utc(2026, 9, 17, 18, 43),
    nextLowTide: DateTime.utc(2026, 9, 17, 12, 31),
    moonPhase: 'Waxing Crescent',
    sunrise: DateTime.utc(2026, 9, 17, 3, 51),
    sunset: DateTime.utc(2026, 9, 17, 15, 49),
    forecastValidAt: DateTime.utc(2026, 9, 17, 8, 0),
  );
}

Future<void> _submit(
  ProviderContainer container, {
  String bait = 'Fresh Sardine',
}) {
  return container.read(logCatchControllerProvider.notifier).submit(
        species: 'Shad',
        location: 'Durban',
        bait: bait,
        hook: '4/0',
        trace: 'Fluorocarbon',
        notes: '',
      );
}

void main() {
  group('LogCatchController - marine conditions available', () {
    test(
      'saves a FishingSession whose marineConditions snapshot carries the '
      'Phase 1 fields straight from the shared provider',
      () async {
        final catchRepo = _RecordingCatchRepository();
        final sessionRepo = _RecordingSessionRepository();

        final container = ProviderContainer(
          overrides: [
            catchRepositoryProvider.overrideWithValue(catchRepo),
            fishingSessionRepositoryProvider.overrideWithValue(sessionRepo),
            marineConditionsProvider.overrideWith((ref) async => _conditions()),
          ],
        );
        addTearDown(container.dispose);

        await _submit(container);

        expect(sessionRepo.saved, hasLength(1));
        final snapshot = sessionRepo.saved.single.marineConditions;
        expect(snapshot, isNotNull);
        expect(snapshot!.precipitation, 0.2);
        expect(snapshot.precipitationProbability, 97.0);
        expect(snapshot.swellDirection, 'SW');
        expect(snapshot.forecastValidAt, DateTime.utc(2026, 9, 17, 8, 0));

        expect(catchRepo.saved, hasLength(1));
        expect(catchRepo.saved.single.sessionId, sessionRepo.saved.single.id);
      },
    );

    test(
      'the marine provider is only built once per submit() - no dedicated '
      'additional weather/marine request is introduced by the Phase 1 '
      'fields',
      () async {
        var buildCount = 0;

        final container = ProviderContainer(
          overrides: [
            catchRepositoryProvider
                .overrideWithValue(_RecordingCatchRepository()),
            fishingSessionRepositoryProvider
                .overrideWithValue(_RecordingSessionRepository()),
            marineConditionsProvider.overrideWith((ref) async {
              buildCount++;
              return _conditions();
            }),
          ],
        );
        addTearDown(container.dispose);

        await _submit(container);

        expect(
          buildCount,
          1,
          reason:
              'submit() must read the shared marineConditionsProvider '
              'exactly once, never issue a second/dedicated fetch',
        );
      },
    );
  });

  group('LogCatchController - marine conditions unavailable', () {
    test(
      'catch and session still save successfully when the provider throws '
      '- marineConditions is null, never fabricated',
      () async {
        final catchRepo = _RecordingCatchRepository();
        final sessionRepo = _RecordingSessionRepository();

        final container = ProviderContainer(
          overrides: [
            catchRepositoryProvider.overrideWithValue(catchRepo),
            fishingSessionRepositoryProvider.overrideWithValue(sessionRepo),
            marineConditionsProvider.overrideWith(
              (ref) async => throw Exception('provider unavailable'),
            ),
          ],
        );
        addTearDown(container.dispose);

        await _submit(container);

        expect(sessionRepo.saved, hasLength(1));
        expect(sessionRepo.saved.single.marineConditions, isNull);
        expect(catchRepo.saved, hasLength(1));

        final state = container.read(logCatchControllerProvider);
        expect(state.value, isFalse, reason: 'false signals conditions were not attached');
        expect(state.hasError, isFalse, reason: 'a marine-fetch failure must not fail the whole submission');
      },
    );
  });

  group('LogCatchController - Gate 1: active Full Fishing Session present', () {
    test(
      'attaches the catch to the active session instead of creating a new '
      'one',
      () async {
        final catchRepo = _RecordingCatchRepository();
        final sessionRepo = _RecordingSessionRepository();

        final activeSession = FishingSession(
          id: 'active-session-1',
          location: 'Cape Recife',
          targetSpecies: 'Not specified',
          dateTime: DateTime.utc(2026, 9, 18, 8, 0),
          startedAt: DateTime.utc(2026, 9, 18, 8, 0),
          status: SessionStatus.active,
          isExplicitSession: true,
        );
        sessionRepo.saved.add(activeSession);

        final container = ProviderContainer(
          overrides: [
            catchRepositoryProvider.overrideWithValue(catchRepo),
            fishingSessionRepositoryProvider.overrideWithValue(sessionRepo),
            marineConditionsProvider.overrideWith((ref) async => _conditions()),
          ],
        );
        addTearDown(container.dispose);

        await _submit(container);

        // No new session was created — only the one already in the fake
        // repository (added above), not a second one from submit().
        expect(sessionRepo.saved, hasLength(1));
        expect(catchRepo.saved, hasLength(1));
        expect(catchRepo.saved.single.sessionId, 'active-session-1');
      },
    );

    test(
      'a second catch during the same active session also attaches to it - '
      'no new session is created either time',
      () async {
        final catchRepo = _RecordingCatchRepository();
        final sessionRepo = _RecordingSessionRepository();

        sessionRepo.saved.add(
          FishingSession(
            id: 'active-session-1',
            location: 'Cape Recife',
            targetSpecies: 'Not specified',
            dateTime: DateTime.utc(2026, 9, 18, 8, 0),
            startedAt: DateTime.utc(2026, 9, 18, 8, 0),
            status: SessionStatus.active,
          ),
        );

        final container = ProviderContainer(
          overrides: [
            catchRepositoryProvider.overrideWithValue(catchRepo),
            fishingSessionRepositoryProvider.overrideWithValue(sessionRepo),
            marineConditionsProvider.overrideWith((ref) async => _conditions()),
          ],
        );
        addTearDown(container.dispose);

        await _submit(container);
        await _submit(container);

        expect(sessionRepo.saved, hasLength(1));
        expect(catchRepo.saved, hasLength(2));
        expect(
          catchRepo.saved.every((c) => c.sessionId == 'active-session-1'),
          isTrue,
        );
      },
    );

    test(
      'an ended (not active) session is ignored - submit() falls back to '
      'the unchanged Quick Catch path and mints its own session',
      () async {
        final catchRepo = _RecordingCatchRepository();
        final sessionRepo = _RecordingSessionRepository();

        sessionRepo.saved.add(
          FishingSession(
            id: 'ended-session-1',
            location: 'Cape Recife',
            targetSpecies: 'Not specified',
            dateTime: DateTime.utc(2026, 9, 18, 8, 0),
            startedAt: DateTime.utc(2026, 9, 18, 8, 0),
            endedAt: DateTime.utc(2026, 9, 18, 10, 0),
            status: SessionStatus.ended,
          ),
        );

        final container = ProviderContainer(
          overrides: [
            catchRepositoryProvider.overrideWithValue(catchRepo),
            fishingSessionRepositoryProvider.overrideWithValue(sessionRepo),
            marineConditionsProvider.overrideWith((ref) async => _conditions()),
          ],
        );
        addTearDown(container.dispose);

        await _submit(container);

        // The pre-existing ended session, plus one freshly-minted Quick
        // Catch session — never attached to the ended one.
        expect(sessionRepo.saved, hasLength(2));
        expect(catchRepo.saved.single.sessionId, isNot('ended-session-1'));
      },
    );
  });

  group('LogCatchController - Action B: Quick Catch UTC timestamp correction', () {
    test(
      '1&4. Quick Catch FishingSession.dateTime is UTC-flagged, and every '
      'other field is unaffected by the correction',
      () async {
        final catchRepo = _RecordingCatchRepository();
        final sessionRepo = _RecordingSessionRepository();

        final container = ProviderContainer(
          overrides: [
            catchRepositoryProvider.overrideWithValue(catchRepo),
            fishingSessionRepositoryProvider.overrideWithValue(sessionRepo),
            marineConditionsProvider.overrideWith((ref) async => _conditions()),
          ],
        );
        addTearDown(container.dispose);

        await _submit(container);

        final session = sessionRepo.saved.single;
        expect(
          session.dateTime.isUtc,
          isTrue,
          reason: 'Quick Catch session dateTime must be captured as UTC '
              '(DateTime.now().toUtc()), never a bare local DateTime.now()',
        );
        // Everything else about Quick Catch behaviour is unchanged.
        expect(session.location, 'Durban');
        expect(session.targetSpecies, 'Shad');
        expect(session.marineConditions, isNotNull);
      },
    );

    test(
      '2. CatchRecord.dateTime is UTC-flagged',
      () async {
        final catchRepo = _RecordingCatchRepository();
        final sessionRepo = _RecordingSessionRepository();

        final container = ProviderContainer(
          overrides: [
            catchRepositoryProvider.overrideWithValue(catchRepo),
            fishingSessionRepositoryProvider.overrideWithValue(sessionRepo),
            marineConditionsProvider.overrideWith((ref) async => _conditions()),
          ],
        );
        addTearDown(container.dispose);

        await _submit(container);

        expect(
          catchRepo.saved.single.dateTime.isUtc,
          isTrue,
          reason: 'CatchRecord dateTime must be captured as UTC '
              '(DateTime.now().toUtc()), never a bare local DateTime.now()',
        );
      },
    );

    test(
      '3. a deterministic SAST (UTC+2) reading round-trips through '
      'FishingSessionDto and CatchDto as the correct, unambiguous UTC '
      'instant',
      () {
        // 10:00 SAST is 08:00 UTC (South Africa has no DST, fixed UTC+2).
        // This is the exact instant DateTime.now().toUtc() must produce
        // when the device's local clock reads 10:00 SAST - expressed
        // directly as the already-correct UTC instant so the assertion is
        // deterministic and independent of the test host's own timezone.
        final correctUtcInstant = DateTime.utc(2026, 9, 18, 8, 0, 0);

        final sessionJson = FishingSessionDto(
          id: 'session-1',
          userId: 'user-1',
          location: 'Durban',
          targetSpecies: 'Shad',
          dateTime: correctUtcInstant,
        ).toJson();
        expect(
          sessionJson['date_time'],
          endsWith('Z'),
          reason: 'the serialised session date_time must carry an explicit '
              'UTC marker, not an offset-less local-looking string',
        );
        expect(
          DateTime.parse(sessionJson['date_time'] as String),
          correctUtcInstant,
        );

        final catchJson = CatchDto(
          id: 'catch-1',
          userId: 'user-1',
          sessionId: 'session-1',
          dateTime: correctUtcInstant,
          species: 'Shad',
          location: 'Durban',
          bait: 'Fresh Sardine',
          hook: '4/0',
          trace: 'Fluorocarbon',
          notes: '',
        ).toJson();
        expect(catchJson['date_time'], endsWith('Z'));
        expect(
          DateTime.parse(catchJson['date_time'] as String),
          correctUtcInstant,
        );
      },
    );
  });
}
