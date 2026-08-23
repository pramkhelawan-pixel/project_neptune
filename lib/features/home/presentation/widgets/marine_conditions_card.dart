import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../lunar/domain/solunar_period.dart';
import '../../../marine/domain/models/marine_conditions.dart';
import '../../../profile/presentation/providers/profile_repository_provider.dart';

class MarineConditionsCard extends ConsumerWidget {
  final MarineConditions conditions;

  const MarineConditionsCard({
    super.key,
    required this.conditions,
  });

  String _formatTime(DateTime? dateTime) {
    if (dateTime == null) {
      return '--';
    }

    return DateFormat('HH:mm').format(dateTime.toLocal());
  }

  String _countdown(DateTime? eventTime) {
    if (eventTime == null) {
      return '--';
    }

    final difference = eventTime.difference(DateTime.now());

    if (difference.isNegative) {
      return 'Now';
    }

    final hours = difference.inHours;
    final minutes = difference.inMinutes.remainder(60);

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }

    return '${minutes}m';
  }

  /// Renders a list of Solunar periods as "HH:mm–HH:mm" ranges, or '--'
  /// when the list is empty — never invents a period for a missing event.
  String _formatPeriods(List<SolunarPeriod> periods) {
    if (periods.isEmpty) {
      return '--';
    }

    return periods
        .map((period) => '${_formatTime(period.start)}–${_formatTime(period.end)}')
        .join(', ');
  }

  String _freshnessLabel() {
    final observedAt = conditions.observedAt;

    if (observedAt == null) {
      return 'Using last known conditions';
    }

    final age = DateTime.now().difference(observedAt);
    final minutes = age.inMinutes;
    final ageText =
        age.inHours > 0 ? '${age.inHours}h ${minutes.remainder(60)}m' : '${minutes}m';

    return conditions.isStale
        ? 'Using last known conditions · $ageText old'
        : 'Last updated $ageText ago';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Only an explicit `true` grants Premium Solunar access. Unauthenticated,
    // null-profile, still-loading, and lookup-failure cases all fall
    // through `valueOrNull` to `null`, and are treated as free/locked by
    // the `?? false` below — never as an error state to work around.
    final isPremium =
        ref.watch(currentProfileProvider).valueOrNull?.isPremium ?? false;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Marine Conditions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              _freshnessLabel(),
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),

            const SizedBox(height: 16),

            _ConditionRow(
              icon: Icons.air,
              label: 'Wind',
              value:
              '${conditions.windSpeed.toStringAsFixed(0)} km/h ${conditions.windDirection}',
            ),

            const Divider(),

            _ConditionRow(
              icon: Icons.grain,
              label: 'Rainfall',
              value: conditions.precipitation != null
                  ? '${conditions.precipitation!.toStringAsFixed(1)} mm'
                  : '--',
            ),

            const Divider(),

            _ConditionRow(
              icon: Icons.umbrella,
              label: 'Rain Chance',
              value: conditions.precipitationProbability != null
                  ? '${conditions.precipitationProbability!.toStringAsFixed(0)}%'
                  : '--',
            ),

            const Divider(),

            _ConditionRow(
              icon: Icons.waves,
              label: 'Swell',
              value:
              '${conditions.swellHeight.toStringAsFixed(1)} m @ ${conditions.swellPeriod.toStringAsFixed(1)} s',
            ),

            const Divider(),

            _ConditionRow(
              icon: Icons.water,
              label: 'Tide',
              value: conditions.tideState,
            ),

            const Divider(),

            _ConditionRow(
              icon: Icons.straighten,
              label: 'Current Height',
              value:
              '${conditions.tideHeight.toStringAsFixed(2)} m',
            ),

            const Divider(),

            _ConditionRow(
              icon: Icons.arrow_upward,
              label: 'Next High',
              value:
              '${_formatTime(conditions.nextHighTide)} (${_countdown(conditions.nextHighTide)})',
            ),

            const Divider(),

            _ConditionRow(
              icon: Icons.arrow_downward,
              label: 'Next Low',
              value:
              '${_formatTime(conditions.nextLowTide)} (${_countdown(conditions.nextLowTide)})',
            ),

            const Divider(),

            _ConditionRow(
              icon: Icons.nightlight_round,
              label: 'Moon',
              value: conditions.moonPhase,
            ),

            const Divider(),

            _ConditionRow(
              icon: Icons.wb_sunny_outlined,
              label: 'Sunrise',
              value: _formatTime(conditions.sunrise),
            ),

            const Divider(),

            _ConditionRow(
              icon: Icons.nights_stay_outlined,
              label: 'Sunset',
              value: _formatTime(conditions.sunset),
            ),

            if (isPremium) ...[
              const Divider(),

              _ConditionRow(
                icon: Icons.nightlight,
                label: 'Moonrise',
                value: _formatTime(conditions.moonrise),
              ),

              const Divider(),

              _ConditionRow(
                icon: Icons.dark_mode_outlined,
                label: 'Moonset',
                value: _formatTime(conditions.moonset),
              ),

              const Divider(),

              _ConditionRow(
                icon: Icons.access_time_filled,
                label: 'Major Periods',
                value: _formatPeriods(conditions.majorPeriods),
              ),

              const Divider(),

              _ConditionRow(
                icon: Icons.access_time,
                label: 'Minor Periods',
                value: _formatPeriods(conditions.minorPeriods),
              ),
            ] else ...[
              const Divider(),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Row(
                  children: [
                    Icon(
                      Icons.lock_outline,
                      size: 20,
                      color: Theme.of(context).colorScheme.primary,
                    ),

                    const SizedBox(width: 12),

                    const Text(
                      'Solunar Intelligence — Premium',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ConditionRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ConditionRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Theme.of(context).colorScheme.primary,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}