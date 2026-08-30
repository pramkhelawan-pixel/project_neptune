import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_text_field.dart';
import '../../../profile/presentation/providers/profile_repository_provider.dart';
import '../../data/length_weight_coefficients_table.dart';
import '../../domain/entities/length_unit.dart';
import '../../domain/entities/length_weight_coefficients.dart';
import '../../domain/entities/length_weight_estimate.dart';
import '../../domain/services/length_weight_calculator.dart';
import '../calculator_copy.dart';

/// The Premium Length-to-Weight calculator: estimate a fish's weight from
/// a measured length using a primary-source-verified South African
/// length-weight study. Fully local -- the calculation never touches
/// Supabase or the network.
///
/// Re-checks Premium entitlement itself, the same fail-closed pattern
/// used by [LicencePage] and the Solunar gate (`currentProfileProvider`),
/// so a change in entitlement while this screen is open never leaves the
/// feature reachable for an unconfirmed user. No separate entitlement
/// mechanism is introduced.
class LengthWeightCalculatorPage extends ConsumerWidget {
  const LengthWeightCalculatorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPremium =
        ref.watch(currentProfileProvider).valueOrNull?.isPremium ?? false;

    if (!isPremium) {
      return Scaffold(
        appBar: AppBar(title: const Text(kLengthWeightCalculatorName)),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              '$kLengthWeightCalculatorName is a Premium feature.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text(kLengthWeightCalculatorName)),
      body: const _LengthWeightCalculatorForm(),
    );
  }
}

class _LengthWeightCalculatorForm extends StatefulWidget {
  const _LengthWeightCalculatorForm();

  @override
  State<_LengthWeightCalculatorForm> createState() =>
      _LengthWeightCalculatorFormState();
}

class _LengthWeightCalculatorFormState
    extends State<_LengthWeightCalculatorForm> {
  static const _calculator = LengthWeightCalculator();

  LengthWeightCoefficients _selectedSpecies =
      lengthWeightCoefficientsTable.first;
  LengthUnit _unit = LengthUnit.centimetres;
  final _lengthController = TextEditingController();
  LengthWeightEstimate? _result;

  @override
  void dispose() {
    _lengthController.dispose();
    super.dispose();
  }

  void _calculate() {
    final length = double.tryParse(_lengthController.text.trim());

    setState(() {
      _result = length == null
          ? LengthWeightEstimate(
              outcome: LengthWeightEstimateOutcome.invalidLength,
              coefficients: _selectedSpecies,
              lengthCm: 0,
            )
          : _calculator.calculate(
              coefficients: _selectedSpecies,
              length: length,
              unit: _unit,
            );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            kLengthWeightCalculatorSubtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),

          const SizedBox(height: 24),

          DropdownMenuFormField<String>(
            initialSelection: _selectedSpecies.speciesId,
            label: const Text('Species'),
            expandedInsets: EdgeInsets.zero,
            menuHeight: 300,
            dropdownMenuEntries: [
              for (final species in lengthWeightCoefficientsTable)
                DropdownMenuEntry(
                  value: species.speciesId,
                  label: species.displayName,
                ),
            ],
            onSelected: (speciesId) {
              if (speciesId == null) return;

              setState(() {
                _selectedSpecies = lengthWeightCoefficientsTable
                    .firstWhere((species) => species.speciesId == speciesId);
                _result = null;
              });
            },
          ),

          const SizedBox(height: 16),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AppTextField(
                  controller: _lengthController,
                  label: 'Length',
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),

              const SizedBox(width: 16),

              SegmentedButton<LengthUnit>(
                segments: const [
                  ButtonSegment(
                    value: LengthUnit.centimetres,
                    label: Text('cm'),
                  ),
                  ButtonSegment(
                    value: LengthUnit.inches,
                    label: Text('in'),
                  ),
                ],
                selected: {_unit},
                onSelectionChanged: (selection) {
                  setState(() {
                    _unit = selection.first;
                    _result = null;
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            'Measurement: ${_selectedSpecies.lengthType.label}',
            style: Theme.of(context).textTheme.bodySmall,
          ),

          const SizedBox(height: 24),

          FilledButton(
            onPressed: _calculate,
            child: const Text('Calculate'),
          ),

          const SizedBox(height: 24),

          if (_result != null) _ResultCard(result: _result!),

          const SizedBox(height: 24),

          Text(
            kLengthWeightMeasurementDisclaimer,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: 8),

          Text(
            kLengthWeightScientificDisclaimer,
            style: Theme.of(context).textTheme.bodySmall,
          ),

          const SizedBox(height: 12),

          Text(
            kLengthWeightSourceAttribution,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({required this.result});

  final LengthWeightEstimate result;

  @override
  Widget build(BuildContext context) {
    switch (result.outcome) {
      case LengthWeightEstimateOutcome.invalidLength:
        return _MessageCard(
          isWarning: true,
          message: 'Enter a valid length greater than zero.',
        );

      case LengthWeightEstimateOutcome.belowValidatedRange:
      case LengthWeightEstimateOutcome.aboveValidatedRange:
        final coefficients = result.coefficients;
        return _MessageCard(
          isWarning: true,
          message:
              'This length is outside the validated study range for '
              '${coefficients.displayName} '
              '(${coefficients.minValidatedLengthCm.toStringAsFixed(1)}'
              '–${coefficients.maxValidatedLengthCm.toStringAsFixed(1)} '
              '${coefficients.lengthUnit} '
              '${coefficients.lengthType.abbreviation}). '
              "Estimating outside that range would mean extrapolating "
              "beyond the study's data, so Neptune won't show a weight "
              'for this length.',
        );

      case LengthWeightEstimateOutcome.success:
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Estimated weight: '
                  '${result.estimatedWeightKg!.toStringAsFixed(2)} kg',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        );
    }
  }
}

class _MessageCard extends StatelessWidget {
  const _MessageCard({required this.message, required this.isWarning});

  final String message;
  final bool isWarning;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isWarning
          ? Theme.of(context).colorScheme.errorContainer
          : Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(message),
      ),
    );
  }
}
