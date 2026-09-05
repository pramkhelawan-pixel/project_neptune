import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:project_neptune/core/theme/app_theme.dart';
import 'package:project_neptune/features/authentication/data/auth_repository.dart';
import 'package:project_neptune/features/authentication/presentation/pages/login_page.dart';
import 'package:project_neptune/features/authentication/presentation/providers/auth_controller.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

Future<void> _pumpLoginPage(
  WidgetTester tester,
  AuthRepository authRepository,
) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [authRepositoryProvider.overrideWithValue(authRepository)],
      child: MaterialApp(theme: AppTheme.neptune, home: const LoginPage()),
    ),
  );
}

Future<void> _openForgotPasswordDialogAndSubmit(
  WidgetTester tester,
  String email,
) async {
  await tester.tap(find.text('Forgot password?'));
  await tester.pump();

  await tester.enterText(
    find.descendant(
      of: find.byType(AlertDialog),
      matching: find.byType(TextFormField),
    ),
    email,
  );

  await tester.tap(find.text('Send Reset Link'));
  // sendPasswordReset() is awaited across two AsyncValue.guard state
  // transitions (Loading, then Data/Error) before _send() resumes --
  // pumpAndSettle() is deliberately avoided throughout this suite (see
  // licence_page_test.dart), so this drains it explicitly instead.
  await tester.pump();
  await tester.pump();
  await tester.pump();
}

void main() {
  late MockAuthRepository authRepository;

  setUp(() {
    authRepository = MockAuthRepository();
  });

  group('LoginPage forgot-password dialog', () {
    testWidgets(
      'a failed reset request shows the generic error message',
      (tester) async {
        when(() => authRepository.resetPasswordForEmail(any()))
            .thenAnswer((_) async => throw Exception('boom'));

        await _pumpLoginPage(tester, authRepository);
        await _openForgotPasswordDialogAndSubmit(tester, 'angler@example.com');

        expect(
          find.text(
            'Something went wrong sending the reset email. Please try again in a moment.',
          ),
          findsOneWidget,
        );
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'structural/lifecycle coverage: after a failed reset request, '
      'dismissing the dialog with Cancel disposes cleanly (no exception, '
      'dialog removed) under this widget-test harness -- the Form/'
      'TextFormField remain mounted on this error branch (unlike the '
      'success branch), so this at least confirms that alone does not '
      'throw here. '
      'This test does NOT reproduce or verify a fix for the '
      "platform-specific '_dependents.isEmpty' crash confirmed via live "
      'device reproduction: that crash depends on real Android IME/focus '
      'animation timing that flutter_test does not simulate, and this exact '
      'test was independently confirmed to pass identically with the '
      'FocusScope.unfocus() fix present or removed. Live device/emulator '
      're-testing remains the only confirmed way to verify that fix.',
      (tester) async {
        when(() => authRepository.resetPasswordForEmail(any()))
            .thenAnswer((_) async => throw Exception('boom'));

        await _pumpLoginPage(tester, authRepository);
        await _openForgotPasswordDialogAndSubmit(tester, 'angler@example.com');

        // Confirm the error branch (Form + TextFormField still mounted) is
        // actually the one on screen before exercising the crash path.
        expect(
          find.descendant(
            of: find.byType(AlertDialog),
            matching: find.byType(Form),
          ),
          findsOneWidget,
        );

        await tester.tap(find.text('Cancel'));
        await tester.pump();

        expect(tester.takeException(), isNull);
        expect(find.byType(AlertDialog), findsNothing);
      },
    );

    testWidgets(
      'a successful reset request does not require the Cancel fix (Form is '
      'already unmounted on this branch)',
      (tester) async {
        when(() => authRepository.resetPasswordForEmail(any()))
            .thenAnswer((_) async {});

        await _pumpLoginPage(tester, authRepository);
        await _openForgotPasswordDialogAndSubmit(tester, 'angler@example.com');

        expect(
          find.text(
            "If an account exists for that email, we've sent a link to "
            'reset your password. Check your inbox.',
          ),
          findsOneWidget,
        );

        await tester.tap(find.text('Back to Sign In'));
        await tester.pump();

        expect(tester.takeException(), isNull);
        expect(find.byType(AlertDialog), findsNothing);
      },
    );
  });
}
