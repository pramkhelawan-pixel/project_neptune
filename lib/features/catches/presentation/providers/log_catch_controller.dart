import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../marine/domain/models/marine_conditions.dart';
import '../../../marine/presentation/providers/marine_provider.dart';
import '../../../session/domain/entities/fishing_session.dart';
import '../../../session/presentation/providers/fishing_session_repository_provider.dart';
import '../../domain/entities/catch_record.dart';
import 'catch_provider.dart';

class LogCatchController extends AsyncNotifier<bool> {
  @override
  FutureOr<bool> build() => true;

  /// Returns true once saved. The resolved state value indicates whether
  /// marine conditions were actually attached (false if the fetch failed
  /// and the save proceeded without them) — see fishing_session.dart.
  Future<void> submit({
    required String species,
    required String location,
    String? fishingSpotId,
    double? weightKg,
    double? lengthCm,
    required String bait,
    required String hook,
    required String trace,
    required String notes,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      const uuid = Uuid();

      // Gate 1: if the user has an active Full Fishing Session, this catch
      // attaches to it instead of spawning a new session — otherwise
      // Start/End Fishing would be disconnected from the catches logged in
      // between. The active session keeps its one Start-time conditions
      // snapshot; per-catch conditions are explicitly out of Gate 1 scope.
      final activeSession =
          await ref.read(activeSessionProvider.future);

      final String sessionId;
      final bool conditionsAttached;

      if (activeSession != null && activeSession.isActive) {
        sessionId = activeSession.id;
        conditionsAttached = activeSession.marineConditions != null;
      } else {
        // Quick Catch — unchanged from pre-Gate-1 behaviour. TEMPORARY:
        // still a 1:1 catch-session for the no-active-session case, until
        // a later gate revisits whether Quick Catch should ever attach to
        // anything else. See deferred-work list.
        MarineConditions? conditions;
        try {
          conditions = await ref.read(marineConditionsProvider.future);
        } catch (_) {
          conditions = null;
        }

        final session = FishingSession(
          id: uuid.v4(),
          location: location,
          targetSpecies: species,
          dateTime: DateTime.now().toUtc(),
          marineConditions: conditions,
          fishingSpotId: fishingSpotId,
        );

        await ref
            .read(fishingSessionRepositoryProvider)
            .save(session);

        sessionId = session.id;
        conditionsAttached = conditions != null;
      }

      final catchRecord = CatchRecord(
        id: uuid.v4(),
        sessionId: sessionId,
        dateTime: DateTime.now().toUtc(),
        species: species,
        location: location,
        weightKg: weightKg,
        lengthCm: lengthCm,
        bait: bait,
        hook: hook,
        trace: trace,
        notes: notes,
      );

      await ref.read(catchRepositoryProvider).save(catchRecord);

      return conditionsAttached;
    });
  }
}

final logCatchControllerProvider =
AsyncNotifierProvider<LogCatchController, bool>(
  LogCatchController.new,
);
