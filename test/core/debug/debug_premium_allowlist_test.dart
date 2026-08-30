import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/core/debug/debug_premium_allowlist.dart';

void main() {
  group('isDebugPremiumAllowlisted', () {
    test('debug build + p.ramkhelawan@gmail.com -> true', () {
      expect(
        isDebugPremiumAllowlisted(
          'p.ramkhelawan@gmail.com',
          debugMode: true,
        ),
        isTrue,
      );
    });

    test('debug build + ramkhelawan.nitasha@gmail.com -> true', () {
      expect(
        isDebugPremiumAllowlisted(
          'ramkhelawan.nitasha@gmail.com',
          debugMode: true,
        ),
        isTrue,
      );
    });

    test('debug build + a different, unrelated email -> false', () {
      expect(
        isDebugPremiumAllowlisted(
          'someone.else@example.com',
          debugMode: true,
        ),
        isFalse,
      );
    });

    test('debug build + null email -> false', () {
      expect(
        isDebugPremiumAllowlisted(null, debugMode: true),
        isFalse,
      );
    });

    test(
      'a simulated release/profile build (debugMode: false) never '
      'allowlists, even for the exact allowlisted emails',
      () {
        expect(
          isDebugPremiumAllowlisted(
            'p.ramkhelawan@gmail.com',
            debugMode: false,
          ),
          isFalse,
        );
        expect(
          isDebugPremiumAllowlisted(
            'ramkhelawan.nitasha@gmail.com',
            debugMode: false,
          ),
          isFalse,
        );
      },
    );

    test('matching is case-insensitive on the email, not a fuzzy match', () {
      expect(
        isDebugPremiumAllowlisted(
          'P.Ramkhelawan@Gmail.com',
          debugMode: true,
        ),
        isTrue,
      );
      expect(
        isDebugPremiumAllowlisted(
          'p.ramkhelawanX@gmail.com',
          debugMode: true,
        ),
        isFalse,
      );
    });
  });
}
