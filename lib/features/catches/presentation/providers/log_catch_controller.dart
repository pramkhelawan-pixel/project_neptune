import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../marine/presentation/providers/marine_provider.dart';
import '../../../session/domain/entities/fishing_session.dart';
import '../../../session/presentation/providers/fishing_session_repository_provider.dart';
import '../../domain/entities/catch_record.dart';
import 'catch_provider.dart';

class LogCatchController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> submit({
    required String species,
    required String location,
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

      final conditions = await ref.read(
        marineConditionsProvider.future,
      );

      // TEMPORARY: 1:1 catch-session until real multi-catch session UI
      // exists. Every logged catch spawns its own dedicated FishingSession
      // row instead of attaching to a user-initiated trip. Revisit once
      // session-management UI is built — see deferred-work list.
      final session = FishingSession(
        id: uuid.v4(),
        location: location,
        targetSpecies: species,
        dateTime: DateTime.now(),
        marineConditions: conditions,
      );

      await ref
          .read(fishingSessionRepositoryProvider)
          .save(session);

      final catchRecord = CatchRecord(
        id: uuid.v4(),
        sessionId: session.id,
        dateTime: DateTime.now(),
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
    });
  }
}

final logCatchControllerProvider =
AsyncNotifierProvider<LogCatchController, void>(
  LogCatchController.new,
);
