import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/app_text_field.dart';
import '../../domain/entities/fishing_licence.dart';
import '../../domain/licence_exceptions.dart';
import '../providers/licence_provider.dart';
import '../widgets/licence_disclaimer.dart';

/// Selects a PDF for the user's fishing licence, collects the licence
/// metadata, and saves both locally. Used for both "Add Fishing Licence"
/// and "Replace Licence" -- both are the same flow.
class LicenceAddPage extends ConsumerStatefulWidget {
  const LicenceAddPage({super.key});

  @override
  ConsumerState<LicenceAddPage> createState() => _LicenceAddPageState();
}

class _LicenceAddPageState extends ConsumerState<LicenceAddPage> {
  final _formKey = GlobalKey<FormState>();
  final _anglerNameController = TextEditingController();
  final _licenceNumberController = TextEditingController();
  final _issuingAuthorityController = TextEditingController();

  File? _selectedFile;
  String? _selectedFileName;
  DateTime? _validFrom;
  DateTime? _expiryDate;
  bool _isSaving = false;
  String? _errorMessage;

  @override
  void dispose() {
    _anglerNameController.dispose();
    _licenceNumberController.dispose();
    _issuingAuthorityController.dispose();
    super.dispose();
  }

  Future<void> _pickPdf() async {
    final file = await ref.read(pdfPickerProvider).pickPdf();

    if (file == null) return;

    setState(() {
      _selectedFile = file;
      _selectedFileName = file.uri.pathSegments.last;
      _errorMessage = null;
    });
  }

  Future<void> _pickDate({required bool isValidFrom}) async {
    final now = DateTime.now();

    final picked = await showDatePicker(
      context: context,
      initialDate: isValidFrom ? now : now.add(const Duration(days: 365)),
      firstDate: DateTime(now.year - 10),
      lastDate: DateTime(now.year + 10),
    );

    if (picked == null) return;

    setState(() {
      if (isValidFrom) {
        _validFrom = picked;
      } else {
        _expiryDate = picked;
      }
    });
  }

  Future<void> _save() async {
    final file = _selectedFile;

    if (file == null) return;
    if (!_formKey.currentState!.validate()) return;

    if (_validFrom == null || _expiryDate == null) {
      setState(() {
        _errorMessage = 'Please set both the valid-from and expiry dates.';
      });
      return;
    }

    setState(() {
      _isSaving = true;
      _errorMessage = null;
    });

    try {
      final licence = FishingLicence(
        // Overwritten by the repository with the final stored path.
        pdfPath: file.path,
        anglerName: _anglerNameController.text.trim(),
        licenceNumber: _licenceNumberController.text.trim(),
        issuingAuthority: _issuingAuthorityController.text.trim(),
        validFrom: _validFrom!,
        expiryDate: _expiryDate!,
        originalFileName: _selectedFileName,
      );

      await ref.read(licenceRepositoryProvider).saveLicence(
            licence: licence,
            pdfFile: file,
          );

      ref.invalidate(storedLicenceProvider);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Fishing licence saved.')),
      );

      Navigator.of(context).pop();
    } on InvalidPdfException {
      if (!mounted) return;

      setState(() {
        _isSaving = false;
        _selectedFile = null;
        _selectedFileName = null;
        _errorMessage =
            'The selected file is not a valid PDF. Please choose a '
            'different file.';
      });
    } catch (error) {
      if (!mounted) return;

      setState(() {
        _isSaving = false;
        _errorMessage = "Couldn't save the licence. Please try again.";
      });
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Not set';
    return DateFormat('dd MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Fishing Licence')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LicenceDisclaimer(),
              const SizedBox(height: 16),
              if (_selectedFile == null)
                OutlinedButton.icon(
                  onPressed: _pickPdf,
                  icon: const Icon(Icons.upload_file_outlined),
                  label: const Text('Select PDF'),
                )
              else ...[
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.picture_as_pdf_outlined),
                  title: Text(_selectedFileName ?? 'Selected PDF'),
                ),
                OutlinedButton.icon(
                  onPressed: _pickPdf,
                  icon: const Icon(Icons.swap_horiz),
                  label: const Text('Choose a Different PDF'),
                ),
                const SizedBox(height: 24),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextField(
                        controller: _anglerNameController,
                        label: 'Angler Name',
                        validator: (value) => (value == null || value.trim().isEmpty)
                            ? 'Required'
                            : null,
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        controller: _licenceNumberController,
                        label: 'Licence Number',
                        validator: (value) => (value == null || value.trim().isEmpty)
                            ? 'Required'
                            : null,
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        controller: _issuingAuthorityController,
                        label: 'Issuing Authority',
                        validator: (value) => (value == null || value.trim().isEmpty)
                            ? 'Required'
                            : null,
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Valid From'),
                        subtitle: Text(_formatDate(_validFrom)),
                        trailing: const Icon(Icons.edit_calendar_outlined),
                        onTap: () => _pickDate(isValidFrom: true),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Expiry Date'),
                        subtitle: Text(_formatDate(_expiryDate)),
                        trailing: const Icon(Icons.edit_calendar_outlined),
                        onTap: () => _pickDate(isValidFrom: false),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                if (_errorMessage != null) ...[
                  Text(
                    _errorMessage!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
                FilledButton(
                  onPressed: _isSaving ? null : _save,
                  child: _isSaving
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Save Licence'),
                ),
              ],
              if (_selectedFile == null && _errorMessage != null) ...[
                const SizedBox(height: 12),
                Text(
                  _errorMessage!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
