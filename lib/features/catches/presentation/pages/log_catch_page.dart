import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import '../providers/catch_provider.dart';
import '../providers/log_catch_controller.dart';

class LogCatchPage extends ConsumerStatefulWidget {
  const LogCatchPage({
    super.key,
  });

  @override
  ConsumerState<LogCatchPage> createState() => _LogCatchPageState();
}

class _LogCatchPageState extends ConsumerState<LogCatchPage> {
  final _formKey = GlobalKey<FormState>();

  final _speciesController = TextEditingController();
  final _locationController = TextEditingController();
  final _weightController = TextEditingController();
  final _lengthController = TextEditingController();
  final _baitController = TextEditingController();
  final _hookController = TextEditingController();
  final _traceController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _speciesController.dispose();
    _locationController.dispose();
    _weightController.dispose();
    _lengthController.dispose();
    _baitController.dispose();
    _hookController.dispose();
    _traceController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    await ref.read(logCatchControllerProvider.notifier).submit(
      species: _speciesController.text.trim(),
      location: _locationController.text.trim(),
      weightKg: double.tryParse(_weightController.text.trim()),
      lengthCm: double.tryParse(_lengthController.text.trim()),
      bait: _baitController.text.trim(),
      hook: _hookController.text.trim(),
      trace: _traceController.text.trim(),
      notes: _notesController.text.trim(),
    );

    if (!mounted) return;

    final state = ref.read(logCatchControllerProvider);

    state.whenOrNull(
      error: (error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
          ),
        );
      },
      data: (conditionsAttached) {
        ref.invalidate(catchHistoryProvider);

        if (!conditionsAttached) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Catch saved, but conditions unavailable.',
              ),
            ),
          );
        }

        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controllerState = ref.watch(logCatchControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Catch'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextField(
                controller: _speciesController,
                label: 'Species',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the species.';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              AppTextField(
                controller: _locationController,
                label: 'Location',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the location.';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: _weightController,
                      label: 'Weight (kg)',
                      hint: 'Optional',
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: AppTextField(
                      controller: _lengthController,
                      label: 'Length (cm)',
                      hint: 'Optional',
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              AppTextField(
                controller: _baitController,
                label: 'Bait',
                hint: 'Optional',
              ),

              const SizedBox(height: 16),

              AppTextField(
                controller: _hookController,
                label: 'Hook',
                hint: 'Optional',
              ),

              const SizedBox(height: 16),

              AppTextField(
                controller: _traceController,
                label: 'Trace',
                hint: 'Optional',
              ),

              const SizedBox(height: 16),

              AppTextField(
                controller: _notesController,
                label: 'Notes',
                hint: 'Optional',
              ),

              const SizedBox(height: 24),

              PrimaryButton(
                text: 'Save Catch',
                isLoading: controllerState.isLoading,
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
