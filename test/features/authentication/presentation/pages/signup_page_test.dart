import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher_platform_interface/link.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

import 'package:project_neptune/core/theme/app_theme.dart';
import 'package:project_neptune/features/authentication/presentation/pages/signup_page.dart';

/// Records every URL the page attempts to open, instead of touching a real
/// platform channel (which isn't available in a widget test).
class _FakeUrlLauncherPlatform extends UrlLauncherPlatform {
  final List<String> launchedUrls = [];

  @override
  Future<bool> launchUrl(String url, LaunchOptions options) async {
    launchedUrls.add(url);
    return true;
  }

  @override
  LinkDelegate? get linkDelegate => null;
}

Future<void> _pumpSignUpPage(
  WidgetTester tester,
  _FakeUrlLauncherPlatform fakeLauncher,
) async {
  UrlLauncherPlatform.instance = fakeLauncher;

  final router = GoRouter(
    initialLocation: '/signup',
    routes: [
      GoRoute(path: '/signup', builder: (_, _) => const SignUpPage()),
      GoRoute(path: '/home', builder: (_, _) => const SizedBox()),
      GoRoute(path: '/login', builder: (_, _) => const SizedBox()),
    ],
  );

  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp.router(
        theme: AppTheme.neptune,
        routerConfig: router,
      ),
    ),
  );
}

Finder _createAccountButtonFinder() =>
    find.widgetWithText(ElevatedButton, 'Create Account');

void main() {
  late _FakeUrlLauncherPlatform fakeLauncher;

  setUp(() {
    fakeLauncher = _FakeUrlLauncherPlatform();
  });

  group('SignUpPage consent checkbox', () {
    testWidgets('starts unchecked', (tester) async {
      await _pumpSignUpPage(tester, fakeLauncher);

      final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
      expect(checkbox.value, isFalse);
    });

    testWidgets('Create Account is disabled while unchecked', (tester) async {
      await _pumpSignUpPage(tester, fakeLauncher);

      final button = tester.widget<ElevatedButton>(_createAccountButtonFinder());
      expect(button.onPressed, isNull);
    });

    testWidgets('Create Account becomes enabled once checked', (tester) async {
      await _pumpSignUpPage(tester, fakeLauncher);

      await tester.tap(find.byType(Checkbox));
      await tester.pump();

      final button = tester.widget<ElevatedButton>(_createAccountButtonFinder());
      expect(button.onPressed, isNotNull);
    });

    testWidgets('unchecking disables Create Account again', (tester) async {
      await _pumpSignUpPage(tester, fakeLauncher);

      await tester.tap(find.byType(Checkbox));
      await tester.pump();
      expect(
        tester.widget<ElevatedButton>(_createAccountButtonFinder()).onPressed,
        isNotNull,
      );

      await tester.tap(find.byType(Checkbox));
      await tester.pump();

      final button = tester.widget<ElevatedButton>(_createAccountButtonFinder());
      expect(button.onPressed, isNull);
    });
  });

  group('SignUpPage legal document links', () {
    testWidgets('tapping "Terms & Conditions" opens the public Terms URL', (
      tester,
    ) async {
      await _pumpSignUpPage(tester, fakeLauncher);

      await tester.tapOnText(find.textRange.ofSubstring('Terms & Conditions'));
      await tester.pump();

      expect(
        fakeLauncher.launchedUrls,
        contains(
          'https://pramkhelawan-pixel.github.io/project_neptune/terms-and-conditions.html',
        ),
      );
    });

    testWidgets('tapping "Privacy Policy" opens the public Privacy Policy URL', (
      tester,
    ) async {
      await _pumpSignUpPage(tester, fakeLauncher);

      await tester.tapOnText(find.textRange.ofSubstring('Privacy Policy'));
      await tester.pump();

      expect(
        fakeLauncher.launchedUrls,
        contains(
          'https://pramkhelawan-pixel.github.io/project_neptune/privacy-policy.html',
        ),
      );
    });

    testWidgets('tapping a legal link does not check the consent box', (
      tester,
    ) async {
      await _pumpSignUpPage(tester, fakeLauncher);

      await tester.tapOnText(find.textRange.ofSubstring('Terms & Conditions'));
      await tester.pump();

      final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
      expect(checkbox.value, isFalse);
      expect(
        tester.widget<ElevatedButton>(_createAccountButtonFinder()).onPressed,
        isNull,
      );
    });
  });
}
