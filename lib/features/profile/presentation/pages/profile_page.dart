import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/providers/app_providers.dart';
import '../../../../core/services/share/recommend_friend_content.dart';
import '../../../../core/services/supabase_service.dart';
import '../../../authentication/presentation/providers/auth_controller.dart';
import '../../../calculators/presentation/calculator_copy.dart';
import '../../../calculators/presentation/pages/length_weight_calculator_page.dart';
import '../../../licence/presentation/licence_copy.dart';
import '../../../licence/presentation/pages/licence_page.dart';
import '../../../licence/presentation/providers/licence_provider.dart';
import '../providers/profile_repository_provider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  static const String _appVersion = '1.0.0';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = SupabaseService.client.auth.currentUser;
    final authState = ref.watch(authControllerProvider);
    final hasLicenceAccess =
        ref.watch(licenceEntitlementProvider).valueOrNull ?? false;
    final isPremium =
        ref.watch(currentProfileProvider).valueOrNull?.isPremium ?? false;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    child: Text(
                      _initials(user?.email),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.email ?? 'Unknown angler',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          'Neptune angler',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ),
              leading: const Icon(Icons.info_outline),
              title: const Text('App Version'),
              trailing: const Text(_appVersion),
            ),
          ),

          const SizedBox(height: 20),

          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Builder(
              builder: (tileContext) => ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                leading: const Icon(Icons.ios_share),
                title: const Text('Recommend a Friend'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _recommendAFriend(tileContext, ref),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ),
              leading: Icon(
                hasLicenceAccess ? Icons.badge_outlined : Icons.lock_outline,
              ),
              title: Text(
                hasLicenceAccess
                    ? kLicenceVaultName
                    : '🔒 $kLicenceVaultName',
              ),
              subtitle: hasLicenceAccess ? null : const Text('Premium'),
              trailing: const Icon(Icons.chevron_right),
              onTap: hasLicenceAccess
                  ? () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const LicencePage(),
                        ),
                      )
                  : null,
            ),
          ),

          const SizedBox(height: 20),

          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ),
              leading: Icon(
                isPremium ? Icons.calculate_outlined : Icons.lock_outline,
              ),
              title: Text(
                isPremium
                    ? kLengthWeightCalculatorName
                    : '🔒 $kLengthWeightCalculatorName',
              ),
              subtitle: isPremium ? null : const Text('Premium'),
              trailing: const Icon(Icons.chevron_right),
              onTap: isPremium
                  ? () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const LengthWeightCalculatorPage(),
                        ),
                      )
                  : null,
            ),
          ),

          const SizedBox(height: 20),

          FilledButton.icon(
            onPressed: authState.isLoading
                ? null
                : () => ref.read(authControllerProvider.notifier).signOut(),
            icon: authState.isLoading
                ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
                : const Icon(Icons.logout),
            label: const Text('Sign Out'),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          ),

          const SizedBox(height: 12),

          TextButton(
            onPressed: () => _showDeleteAccountDialog(context),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Delete Account'),
          ),
        ],
      ),
    );
  }

  Future<void> _showDeleteAccountDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (dialogContext) => const _DeleteAccountDialog(),
    );
  }

  Future<void> _recommendAFriend(BuildContext context, WidgetRef ref) async {
    final box = context.findRenderObject() as RenderBox?;

    final result = await ref.read(shareServiceProvider).shareText(
      text: RecommendFriendContent.shareText,
      sharePositionOrigin:
          box != null ? box.localToGlobal(Offset.zero) & box.size : null,
    );

    if (!context.mounted) return;

    if (result.status == ShareResultStatus.unavailable) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Couldn't open the share sheet. Please try again."),
        ),
      );
    }
  }

  String _initials(String? email) {
    if (email == null || email.isEmpty) {
      return '?';
    }

    return email[0].toUpperCase();
  }
}

/// Warns the user that deletion is permanent, requires an explicit
/// destructive confirmation (not just "OK"), then deletes the account via
/// the `delete-account` Edge Function and signs out locally. `AppRouter`'s
/// existing redirect (session == null -> /login) handles returning to the
/// login screen once sign-out completes -- no navigation call needed here.
class _DeleteAccountDialog extends ConsumerStatefulWidget {
  const _DeleteAccountDialog();

  @override
  ConsumerState<_DeleteAccountDialog> createState() =>
      _DeleteAccountDialogState();
}

class _DeleteAccountDialogState extends ConsumerState<_DeleteAccountDialog> {
  bool _isDeleting = false;
  String? _errorMessage;

  Future<void> _confirmDelete() async {
    setState(() {
      _isDeleting = true;
      _errorMessage = null;
    });

    try {
      await ref.read(profileRepositoryProvider).deleteAccount();

      if (!mounted) return;

      await ref.read(authControllerProvider.notifier).signOut();
    } catch (error) {
      if (!mounted) return;

      setState(() {
        _isDeleting = false;
        _errorMessage = error.toString();
      });
      return;
    }

    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Account'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'This permanently deletes your Neptune account, including your '
            'catch history and fishing sessions. This cannot be undone.',
          ),
          if (_errorMessage != null) ...[
            const SizedBox(height: 12),
            Text(
              _errorMessage!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ],
        ],
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
              : const Text('Delete My Account'),
        ),
      ],
    );
  }
}
