import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../profile/presentation/providers/profile_repository_provider.dart';
import '../../data/repositories/licence_entitlement_repository_impl.dart';
import '../../data/repositories/licence_repository_impl.dart';
import '../../data/services/file_picker_pdf_picker.dart';
import '../../data/services/licence_pdf_storage.dart';
import '../../data/services/open_filex_pdf_viewer_launcher.dart';
import '../../domain/entities/fishing_licence.dart';
import '../../domain/repositories/licence_entitlement_repository.dart';
import '../../domain/repositories/licence_repository.dart';
import '../../domain/services/pdf_picker.dart';
import '../../domain/services/pdf_viewer_launcher.dart';

final licencePdfStorageProvider = Provider<LicencePdfStorage>(
  (ref) => LicencePdfStorage(),
);

final licenceRepositoryProvider = Provider<LicenceRepository>(
  (ref) => LicenceRepositoryImpl(
    pdfStorage: ref.watch(licencePdfStorageProvider),
  ),
);

/// Separate from [licenceRepositoryProvider] on purpose -- entitlement
/// state must never live inside the PDF document repository.
final licenceEntitlementRepositoryProvider =
    Provider<LicenceEntitlementRepository>(
  (ref) => LicenceEntitlementRepositoryImpl(),
);

final pdfPickerProvider = Provider<PdfPicker>(
  (ref) => const FilePickerPdfPicker(),
);

final pdfViewerLauncherProvider = Provider<PdfViewerLauncher>(
  (ref) => const OpenFilexPdfViewerLauncher(),
);

/// Whether the Digital Fishing Licence feature is unlocked.
///
/// Reuses the existing [currentProfileProvider]/`Profile.isPremium`
/// entitlement -- no separate entitlement system. A live, confirmed
/// `isPremium == true` both unlocks access and persists a local
/// last-confirmed-Premium flag (via [LicenceEntitlementRepository]); a
/// live, confirmed `isPremium == false` clears that flag. When the live
/// check is loading or fails, the local flag is consulted instead, so a
/// previously-confirmed Premium user keeps offline access to their own
/// stored licence -- a user who was never confirmed has no flag to fall
/// back on and stays locked (fails closed).
///
/// This cache is scoped entirely to the licence feature and is never read
/// by, or written into, the existing Solunar Premium gate.
final licenceEntitlementProvider = FutureProvider<bool>((ref) async {
  final entitlementRepository = ref.watch(licenceEntitlementRepositoryProvider);

  try {
    final profile = await ref.watch(currentProfileProvider.future);
    final isPremium = profile?.isPremium ?? false;

    if (isPremium) {
      await entitlementRepository.confirmPremium();
    } else {
      await entitlementRepository.clearPremiumConfirmation();
    }

    return isPremium;
  } catch (_) {
    return entitlementRepository.hasConfirmedPremium();
  }
});

final storedLicenceProvider = FutureProvider<FishingLicence?>((ref) {
  return ref.watch(licenceRepositoryProvider).getLicence();
});
