import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/fishing_licence.dart';
import '../../domain/services/pdf_viewer_launcher.dart';
import '../licence_copy.dart';
import '../providers/licence_provider.dart';
import '../widgets/licence_disclaimer.dart';
import 'licence_add_page.dart';

/// The Digital Fishing Licence screen: view, replace, or delete the
/// locally-stored licence PDF. Re-checks Premium entitlement itself (in
/// addition to the entry point on the Profile screen only navigating here
/// when unlocked) so a change in entitlement while this screen is open
/// never leaves the feature reachable for an unconfirmed user.
class LicencePage extends ConsumerWidget {
  const LicencePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPremium = ref.watch(licenceEntitlementProvider).valueOrNull ?? false;

    if (!isPremium) {
      return Scaffold(
        appBar: AppBar(title: const Text(kLicenceVaultName)),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              '$kLicenceVaultName is a Premium feature.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    final licenceAsync = ref.watch(storedLicenceProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(kLicenceVaultName)),
      body: licenceAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              "Couldn't load your fishing licence.\n\n$error",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        data: (licence) {
          if (licence == null) {
            return _EmptyLicenceView();
          }

          return _LicenceDetailView(licence: licence);
        },
      ),
    );
  }
}

class _EmptyLicenceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('No fishing licence stored'),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const LicenceAddPage(),
                ),
              ),
              icon: const Icon(Icons.upload_file_outlined),
              label: const Text('Add Fishing Licence'),
            ),
          ],
        ),
      ),
    );
  }
}

class _LicenceDetailView extends ConsumerWidget {
  final FishingLicence licence;

  const _LicenceDetailView({required this.licence});

  String _formatDate(DateTime date) => DateFormat('dd MMM yyyy').format(date);

  Future<void> _viewLicence(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(pdfViewerLauncherProvider).open(licence.pdfPath);
    } on PdfOpenException catch (error) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Couldn't open the licence PDF: ${error.message}")),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpired = licence.isExpired;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Chip(
                label: Text(
                  isExpired
                      ? 'Document indicates: Expired'
                      : 'Document indicates: Valid',
                ),
                backgroundColor: isExpired
                    ? Theme.of(context).colorScheme.errorContainer
                    : Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            const SizedBox(height: 12),
            const LicenceDisclaimer(),
            const SizedBox(height: 16),
            _LicenceRow(label: 'Angler Name', value: licence.anglerName),
            _LicenceRow(label: 'Licence Number', value: licence.licenceNumber),
            _LicenceRow(
              label: 'Issuing Authority',
              value: licence.issuingAuthority,
            ),
            _LicenceRow(
              label: 'Valid From',
              value: _formatDate(licence.validFrom),
            ),
            _LicenceRow(
              label: 'Expiry Date',
              value: _formatDate(licence.expiryDate),
            ),
            if (licence.originalFileName != null)
              _LicenceRow(
                label: 'Original File',
                value: licence.originalFileName!,
              ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => _viewLicence(context, ref),
              icon: const Icon(Icons.picture_as_pdf_outlined),
              label: const Text('View Licence'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const LicenceAddPage(),
                ),
              ),
              icon: const Icon(Icons.upload_file_outlined),
              label: const Text('Replace Licence'),
            ),
            const SizedBox(height: 12),
            TextButton.icon(
              onPressed: () => showDialog<void>(
                context: context,
                builder: (_) => const _DeleteLicenceDialog(),
              ),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error,
              ),
              icon: const Icon(Icons.delete_outline),
              label: const Text('Delete Licence'),
            ),
          ],
        ),
      ),
    );
  }
}

class _LicenceRow extends StatelessWidget {
  final String label;
  final String value;

  const _LicenceRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}

class _DeleteLicenceDialog extends ConsumerStatefulWidget {
  const _DeleteLicenceDialog();

  @override
  ConsumerState<_DeleteLicenceDialog> createState() =>
      _DeleteLicenceDialogState();
}

class _DeleteLicenceDialogState extends ConsumerState<_DeleteLicenceDialog> {
  bool _isDeleting = false;

  Future<void> _confirmDelete() async {
    setState(() => _isDeleting = true);

    await ref.read(licenceRepositoryProvider).deleteLicence();
    ref.invalidate(storedLicenceProvider);

    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Licence'),
      content: const Text(
        'This permanently deletes the stored fishing licence PDF and '
        'details from this device. This cannot be undone.',
      ),
      actions: [
        TextButton(
          onPressed: _isDeleting ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _isDeleting ? null : _confirmDelete,
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
          child: _isDeleting
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Delete'),
        ),
      ],
    );
  }
}
