import 'package:flutter/material.dart';

import '../../domain/models/marine_conditions.dart';

class AtmosphericConditionsCard extends StatelessWidget {
  final MarineConditions conditions;

  const AtmosphericConditionsCard({
    super.key,
    required this.conditions,
  });

  @override
  Widget build(BuildContext context) {
    // Background/border/radius/elevation are inherited from CardThemeData
    // (surface1, 1px hairline, 18px radius, elevation 0) rather than
    // repeated here.
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Atmospheric Conditions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            _ConditionRow(
              icon: Icons.thermostat,
              label: 'Water Temperature',
              value:
              '${conditions.waterTemperature.toStringAsFixed(1)} °C',
            ),

            const Divider(),

            _ConditionRow(
              icon: Icons.device_thermostat,
              label: 'Air Temperature',
              value:
              '${conditions.airTemperature.toStringAsFixed(1)} °C',
            ),

            const Divider(),

            _ConditionRow(
              icon: Icons.speed,
              label: 'Atmospheric Pressure',
              value:
              '${conditions.atmosphericPressure.toStringAsFixed(0)} hPa',
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
