import 'package:flutter_test/flutter_test.dart';

import 'package:project_neptune/features/species/domain/regulatory_rules.dart';

void main() {
  const rules = RegulatoryRules();

  group('isProtected', () {
    test('red steenbras is protected', () {
      expect(rules.isProtected('Red Steenbras'), isTrue);
    });

    test('matching is case-insensitive', () {
      expect(rules.isProtected('red steenbras'), isTrue);
      expect(rules.isProtected('RED STEENBRAS'), isTrue);
    });

    test('other species are not protected', () {
      expect(rules.isProtected('Kob'), isFalse);
      expect(rules.isProtected('Galjoen'), isFalse);
    });
  });

  group('isClosedOn - shad (1 Oct - 30 Nov)', () {
    test('open just before the season starts', () {
      expect(rules.isClosedOn('Shad', DateTime(2026, 9, 30)), isFalse);
    });

    test('closed on the first day of the season', () {
      expect(rules.isClosedOn('Shad', DateTime(2026, 10, 1)), isTrue);
    });

    test('closed mid-season', () {
      expect(rules.isClosedOn('Shad', DateTime(2026, 10, 15)), isTrue);
    });

    test('closed on the last day of the season', () {
      expect(rules.isClosedOn('Shad', DateTime(2026, 11, 30)), isTrue);
    });

    test('open just after the season ends', () {
      expect(rules.isClosedOn('Shad', DateTime(2026, 12, 1)), isFalse);
    });

    test('"elf" is treated as an alias for shad', () {
      expect(rules.isClosedOn('Elf', DateTime(2026, 10, 15)), isTrue);
    });
  });

  group('isClosedOn - galjoen (15 Oct - last day of Feb, crosses year boundary)', () {
    test('open just before the season starts', () {
      expect(rules.isClosedOn('Galjoen', DateTime(2026, 10, 14)), isFalse);
    });

    test('closed on the first day of the season', () {
      expect(rules.isClosedOn('Galjoen', DateTime(2026, 10, 15)), isTrue);
    });

    test('closed on 31 December', () {
      expect(rules.isClosedOn('Galjoen', DateTime(2026, 12, 31)), isTrue);
    });

    test('closed on 1 January, the year after the season started', () {
      expect(rules.isClosedOn('Galjoen', DateTime(2027, 1, 1)), isTrue);
    });

    test('closed on 15 January - the year-boundary case', () {
      // This is the case that can't be checked by waiting for "today" to be
      // right, since it's most of a year away from the season's start date.
      // Passing DateTime in as a parameter (rather than reading
      // DateTime.now() inside isClosedOn) is what makes this assertable now.
      expect(rules.isClosedOn('Galjoen', DateTime(2027, 1, 15)), isTrue);
    });

    test('closed on the last day of February in a non-leap year', () {
      expect(rules.isClosedOn('Galjoen', DateTime(2027, 2, 28)), isTrue);
    });

    test('closed on the last day of February in a leap year', () {
      expect(rules.isClosedOn('Galjoen', DateTime(2028, 2, 29)), isTrue);
    });

    test('open on 1 March in a non-leap year', () {
      expect(rules.isClosedOn('Galjoen', DateTime(2027, 3, 1)), isFalse);
    });

    test('open on 1 March in a leap year', () {
      expect(rules.isClosedOn('Galjoen', DateTime(2028, 3, 1)), isFalse);
    });

    test('open in the middle of the off-season', () {
      expect(rules.isClosedOn('Galjoen', DateTime(2027, 6, 15)), isFalse);
    });
  });

  group('isClosedOn - unregulated species', () {
    test('never reports closed, even during shad/galjoen closed dates', () {
      expect(rules.isClosedOn('Kob', DateTime(2026, 10, 15)), isFalse);
      expect(rules.isClosedOn('Kob', DateTime(2027, 1, 15)), isFalse);
    });
  });
}
