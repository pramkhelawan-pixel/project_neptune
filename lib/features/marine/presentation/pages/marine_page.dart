import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../home/presentation/widgets/marine_conditions_card.dart';
import '../../../home/presentation/widgets/readiness_card.dart';
import '../../../readiness/domain/readiness_engine.dart';
import '../providers/marine_provider.dart';
import '../widgets/atmospheric_conditions_card.dart';

class MarinePage extends ConsumerWidget {
  const MarinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marineAsync = ref.watch(marineConditionsProvider);

    return marineAsync.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'Unable to load marine conditions.\n\n$error',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      data: (conditions) {
        final readiness = const ReadinessEngine().calculate(conditions);

        return RefreshIndicator(
          onRefresh: () => ref.refresh(marineConditionsProvider.future),
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ReadinessCard(result: readiness),

                  const SizedBox(height: 20),

                  MarineConditionsCard(conditions: conditions),

                  const SizedBox(height: 20),

                  AtmosphericConditionsCard(conditions: conditions),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
