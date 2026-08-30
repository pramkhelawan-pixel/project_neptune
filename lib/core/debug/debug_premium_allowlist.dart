import 'package:flutter/foundation.dart';

/// TEMPORARY development/testing allowlist.
///
/// Grants a fixed, small set of developer/test accounts Premium access so
/// they can exercise Premium-gated features (Digital Fishing Licence
/// Vault, Solunar) while validating a debug APK on a physical device --
/// without creating a Supabase Premium entitlement or touching any
/// subscription record for those accounts.
///
/// This is NOT production entitlement logic and must never be used,
/// extended, or relied upon as such:
/// - It is gated on [debugMode], which defaults to Flutter's [kDebugMode]
///   -- a compile-time constant that is `false` in release/profile
///   builds -- so this allowlist can never grant access in a build the
///   app would actually ship.
/// - It never grants access to any account other than the two listed
///   below.
/// - Its only call site overrides an already-resolved profile's
///   `isPremium` flag (see `currentProfileProvider`); it never fabricates
///   a profile, and never reads from or writes to Supabase.
///
/// Remove this file (and its one call site) once dedicated Premium QA/test
/// accounts exist in Supabase, or this project ships a real staff/tester
/// entitlement mechanism.
const _debugPremiumAllowlistedEmails = <String>{
  'p.ramkhelawan@gmail.com',
  'ramkhelawan.nitasha@gmail.com',
};

/// Whether [email] should be treated as Premium under the temporary debug
/// allowlist above.
///
/// [debugMode] defaults to [kDebugMode] and exists as a parameter purely
/// so this pure function can be unit-tested against a simulated
/// release/profile build -- real call sites should never pass it
/// explicitly and should rely on the default.
bool isDebugPremiumAllowlisted(String? email, {bool debugMode = kDebugMode}) {
  if (!debugMode || email == null) {
    return false;
  }

  return _debugPremiumAllowlistedEmails.contains(email.trim().toLowerCase());
}
