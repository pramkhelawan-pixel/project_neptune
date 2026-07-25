import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../marine/domain/models/marine_conditions.dart';

class MarineConditionsCard extends StatelessWidget {
  final MarineConditions conditions;

  const MarineConditionsCard({
    super.key,
    required this.conditions,
  });

  String _formatTime(DateTime? dateTime) {
    if (dateTime == null) {
      return 'Not Available';
    }

    return DateFormat('HH:mm').format(dateTime.toLocal());
  }

  @override
  Widget build(BuildContext context) {
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

            const SizedBox(height: 20),

            _ConditionRow(
              icon: Icons.air,
              label: 'Wind',
              value:
              '${conditions.windSpeed.toStringAsFixed(0)} km/h ${conditions.windDirection}',
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
              label: 'Tide Height',
              value: '${conditions.tideHeight.toStringAsFixed(2)} m',
            ),

            const Divider(),

            _ConditionRow(
              icon: Icons.arrow_upward,
              label: 'Next High',
              value: _formatTime(conditions.nextHighTide),
            ),

            const Divider(),

            _ConditionRow(
              icon: Icons.arrow_downward,
              label: 'Next Low',
              value: _formatTime(conditions.nextLowTide),
            ),

            const Divider(),

            _ConditionRow(
              icon: Icons.nightlight_round,
              label: 'Moon',
              value: conditions.moonPhase,
            ),
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
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
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