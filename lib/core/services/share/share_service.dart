import 'package:flutter/material.dart' show Rect;
import 'package:share_plus/share_plus.dart';

/// Reusable wrapper around the platform's native share sheet.
///
/// The only place in the app that talks to `share_plus`. It knows nothing
/// about *what* is being shared — callers pass fully-composed text — so
/// this stays reusable for any future sharing use case (e.g. a V2 referral
/// system with unique links) without modification.
class ShareService {
  /// Triggers the native share sheet with [text].
  ///
  /// [sharePositionOrigin] anchors the iPad/Mac popover; ignored elsewhere.
  /// Never throws — a platform-channel failure returns
  /// [ShareResultStatus.unavailable] so callers can decide whether minimal
  /// feedback is warranted.
  Future<ShareResult> shareText({
    required String text,
    Rect? sharePositionOrigin,
  }) async {
    try {
      return await SharePlus.instance.share(
        ShareParams(text: text, sharePositionOrigin: sharePositionOrigin),
      );
    } catch (_) {
      return ShareResult.unavailable;
    }
  }
}
