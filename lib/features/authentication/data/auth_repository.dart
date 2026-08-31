import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  AuthRepository(this._client);

  final SupabaseClient _client;

  /// Version identifiers for the documents a user agrees to at signup.
  /// Passed through to Supabase Auth as signup metadata so the
  /// `handle_new_user` trigger can record acceptance atomically with
  /// account creation -- see the `legal_acceptances` migration.
  static const currentTermsVersion = '1.0';
  static const currentPrivacyVersion = '1.0';

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) {
    return _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  /// [acceptedLegalTerms] must be true -- callers are expected to have
  /// already gated this on the user explicitly checking the consent
  /// checkbox; this is a defensive assertion, not the enforcement point.
  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required bool acceptedLegalTerms,
  }) {
    assert(
      acceptedLegalTerms,
      'signUp() must not be called before the user accepts the Terms & '
      'Conditions and Privacy Policy.',
    );

    return _client.auth.signUp(
      email: email,
      password: password,
      emailRedirectTo:
          'https://pramkhelawan-pixel.github.io/project_neptune/confirm-email.html',
      data: {
        'terms_version': currentTermsVersion,
        'privacy_version': currentPrivacyVersion,
      },
    );
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  /// Supabase's reset-password endpoint always succeeds regardless of
  /// whether [email] belongs to an account, so this call site never learns
  /// (and must never surface) whether the address exists.
  Future<void> resetPasswordForEmail(String email) {
    return _client.auth.resetPasswordForEmail(
      email,
      redirectTo:
          'https://pramkhelawan-pixel.github.io/project_neptune/reset-password.html',
    );
  }

  Session? get currentSession => _client.auth.currentSession;

  User? get currentUser => _client.auth.currentUser;
}