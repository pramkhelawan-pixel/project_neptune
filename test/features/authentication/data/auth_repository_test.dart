import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:project_neptune/features/authentication/data/auth_repository.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockGoTrueClient extends Mock implements GoTrueClient {}

void main() {
  late MockSupabaseClient client;
  late MockGoTrueClient auth;
  late AuthRepository repository;

  setUp(() {
    client = MockSupabaseClient();
    auth = MockGoTrueClient();
    when(() => client.auth).thenReturn(auth);
    repository = AuthRepository(client);
  });

  group('AuthRepository.signUp', () {
    test(
      'sends the current Terms and Privacy Policy versions as signup metadata',
      () async {
        when(
          () => auth.signUp(
            email: any(named: 'email'),
            password: any(named: 'password'),
            emailRedirectTo: any(named: 'emailRedirectTo'),
            data: any(named: 'data'),
          ),
        ).thenAnswer((_) async => AuthResponse());

        await repository.signUp(
          email: 'angler@example.com',
          password: 'password123',
          acceptedLegalTerms: true,
        );

        final captured = verify(
          () => auth.signUp(
            email: 'angler@example.com',
            password: 'password123',
            emailRedirectTo: any(named: 'emailRedirectTo'),
            data: captureAny(named: 'data'),
          ),
        ).captured.single as Map<String, dynamic>;

        expect(captured['terms_version'], AuthRepository.currentTermsVersion);
        expect(
          captured['privacy_version'],
          AuthRepository.currentPrivacyVersion,
        );
      },
    );

    test(
      'asserts rather than signing up when legal terms were not accepted',
      () {
        expect(
          () => repository.signUp(
            email: 'angler@example.com',
            password: 'password123',
            acceptedLegalTerms: false,
          ),
          throwsA(isA<AssertionError>()),
        );

        verifyNever(
          () => auth.signUp(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        );
      },
    );
  });
}
