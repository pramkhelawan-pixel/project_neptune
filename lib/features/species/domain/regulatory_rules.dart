// -----------------------------------------------------------------------------
// Neptune Species Intelligence System
// -----------------------------------------------------------------------------
// File: regulatory_rules.dart
//
// Purpose:
// Nationwide South African recreational-fishing regulatory constraints
// (per DFFE MLRA regulations) that apply regardless of location. These are
// not per-spot facts, so they live here rather than as data on individual
// fishing spots or species profiles.
// -----------------------------------------------------------------------------

/// Evaluates nationwide closed-season and no-take rules for a species.
class RegulatoryRules {
  const RegulatoryRules();

  /// Species that are fully protected and may never be targeted/kept,
  /// regardless of season.
  static const List<String> _protectedSpecies = [
    'Red Steenbras',
  ];

  /// Whether [speciesName] is a fully protected, no-take species.
  bool isProtected(String speciesName) {
    return _protectedSpecies.any(
      (name) => name.toLowerCase() == speciesName.toLowerCase(),
    );
  }

  /// Whether [speciesName] is inside its closed season on [date].
  ///
  /// - Shad/elf: closed 1 Oct - 30 Nov.
  /// - Galjoen: closed 15 Oct - last day of Feb (crosses the year boundary).
  bool isClosedOn(String speciesName, DateTime date) {
    final name = speciesName.toLowerCase();

    if (name == 'shad' || name == 'elf') {
      return _isWithinMonthDayRange(
        date,
        startMonth: 10,
        startDay: 1,
        endMonth: 11,
        endDay: 30,
      );
    }

    if (name == 'galjoen') {
      // The relevant February is next year's when `date` falls in Oct-Dec,
      // and this year's when `date` falls in Jan-Feb, since the season
      // spans the calendar year boundary.
      final februaryYear = date.month >= 10 ? date.year + 1 : date.year;
      return _isWithinMonthDayRange(
        date,
        startMonth: 10,
        startDay: 15,
        endMonth: 2,
        endDay: _lastDayOfFebruary(februaryYear),
      );
    }

    return false;
  }

  /// True if [date]'s month/day falls within [startMonth]/[startDay] through
  /// [endMonth]/[endDay] inclusive. Handles ranges that cross the calendar
  /// year boundary (e.g. Oct 15 -> Feb 28) as well as ranges that don't.
  bool _isWithinMonthDayRange(
    DateTime date, {
    required int startMonth,
    required int startDay,
    required int endMonth,
    required int endDay,
  }) {
    final monthDay = date.month * 100 + date.day;
    final start = startMonth * 100 + startDay;
    final end = endMonth * 100 + endDay;

    if (start <= end) {
      return monthDay >= start && monthDay <= end;
    }
    return monthDay >= start || monthDay <= end;
  }

  int _lastDayOfFebruary(int year) {
    final isLeapYear = (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
    return isLeapYear ? 29 : 28;
  }
}
