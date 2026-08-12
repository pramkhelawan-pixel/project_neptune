/// V1 static content for the "Recommend a Friend" share action.
///
/// Separated from [ShareService] on purpose: the service is the reusable
/// mechanism, this is the content. V2 can introduce its own content source
/// (e.g. a provider composing a message with a unique referral link) and
/// hand the result to the same `ShareService.shareText` — no changes to
/// the mechanism or the UI that triggers it.
class RecommendFriendContent {
  const RecommendFriendContent._();

  static const String _message =
      'Try Neptune — smarter fishing for the South African coast. '
      'Check out the app and see the marine conditions, tides, species '
      'information and fishing tools.';

  // TODO(neptune): This is the real, final Play Store URL — deterministically
  // derived from the Android applicationId (com.continuumdataguard.neptune).
  // It will 404 until the app is published; no code change needed at launch,
  // just delete this comment once the listing is confirmed live.
  static const String playStoreUrl =
      'https://play.google.com/store/apps/details?id=com.continuumdataguard.neptune';

  /// Fully composed message + link, ready to hand to [ShareService].
  static String get shareText => '$_message\n\n$playStoreUrl';
}
