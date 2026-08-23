import 'solunar_period.dart';

/// Result of a [SolunarEngine] calculation for one calendar day at one
/// location: moonrise/moonset (either may be absent — see
/// [SolunarEngine]) plus the derived major and minor feeding periods.
class SolunarData {
  final DateTime? moonrise;
  final DateTime? moonset;

  /// Feeding periods centred on lunar transit (moon overhead) and
  /// antitransit (moon underfoot). Always exactly two entries — transit and
  /// antitransit occur every day regardless of whether the Moon is above
  /// the horizon at that moment.
  final List<SolunarPeriod> majorPeriods;

  /// Feeding periods centred on moonrise and moonset. Zero, one, or two
  /// entries depending on which of those events occur within the day.
  final List<SolunarPeriod> minorPeriods;

  const SolunarData({
    required this.moonrise,
    required this.moonset,
    required this.majorPeriods,
    required this.minorPeriods,
  });
}
