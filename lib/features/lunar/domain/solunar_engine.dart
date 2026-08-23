import 'moon_position.dart';
import 'solunar_data.dart';
import 'solunar_period.dart';

/// Horizon-crossing altitude (degrees) used for moonrise/moonset. Unlike
/// the Sun's roughly -0.833° threshold (refraction plus solar
/// semi-diameter), the Moon's much larger parallax pushes its apparent
/// rise/set point slightly above the geometric horizon.
const _moonHorizonAltitude = 0.125;

const _periodHalfWidth = Duration(hours: 1);

/// Sampling step used to scan a day for altitude crossings/extrema. Small
/// enough that linear/parabolic interpolation between samples gives
/// sub-minute accuracy; large enough to stay cheap on a mobile device
/// (~720 Moon-position evaluations per call).
const _sampleStep = Duration(minutes: 2);

/// Computes moonrise, moonset, and the classic Solunar major/minor feeding
/// periods for a given date and location, purely from local astronomical
/// calculation (no network access).
///
/// Major periods are centred on lunar transit and antitransit (the Moon
/// crossing the observer's meridian overhead and underfoot) and always
/// occur once each per day. Minor periods are centred on moonrise and
/// moonset and may be absent on a given day — see [SolunarData].
class SolunarEngine {
  const SolunarEngine();

  SolunarData calculate(
    DateTime date, {
    required double latitude,
    required double longitude,
  }) {
    final dayStart = _startOfUtcDay(date.toUtc());
    final dayEnd = dayStart.add(const Duration(days: 1));

    final samples = <_Sample>[];

    for (var t = dayStart; !t.isAfter(dayEnd); t = t.add(_sampleStep)) {
      final altitude = MoonPosition.altitudeDegrees(
        utc: t,
        latitude: latitude,
        longitude: longitude,
      );

      samples.add(_Sample(t, altitude));
    }

    final moonrise = _findCrossing(samples, rising: true);
    final moonset = _findCrossing(samples, rising: false);
    final transit = _findExtremum(samples, findMax: true);
    final antitransit = _findExtremum(samples, findMax: false);

    return SolunarData(
      moonrise: moonrise,
      moonset: moonset,
      majorPeriods: [
        _periodAround(transit),
        _periodAround(antitransit),
      ],
      minorPeriods: [
        if (moonrise != null) _periodAround(moonrise),
        if (moonset != null) _periodAround(moonset),
      ],
    );
  }

  static DateTime _startOfUtcDay(DateTime utc) {
    return DateTime.utc(utc.year, utc.month, utc.day);
  }

  static SolunarPeriod _periodAround(DateTime center) {
    return SolunarPeriod(
      start: center.subtract(_periodHalfWidth),
      end: center.add(_periodHalfWidth),
    );
  }

  /// First time the Moon's altitude crosses [_moonHorizonAltitude] in the
  /// requested direction, or null if no such crossing occurs within the
  /// scanned day — which happens when the Moon stays continuously above or
  /// below the horizon, as it can at high latitudes.
  static DateTime? _findCrossing(
    List<_Sample> samples, {
    required bool rising,
  }) {
    for (var i = 1; i < samples.length; i++) {
      final prev = samples[i - 1];
      final curr = samples[i];

      final crossesUp = prev.altitude < _moonHorizonAltitude &&
          curr.altitude >= _moonHorizonAltitude;
      final crossesDown = prev.altitude >= _moonHorizonAltitude &&
          curr.altitude < _moonHorizonAltitude;

      if (rising ? crossesUp : crossesDown) {
        final span = curr.altitude - prev.altitude;

        final fraction =
            span == 0 ? 0.0 : (_moonHorizonAltitude - prev.altitude) / span;

        final offsetMicros =
            (curr.time.difference(prev.time).inMicroseconds * fraction)
                .round();

        return prev.time.add(Duration(microseconds: offsetMicros));
      }
    }

    return null;
  }

  /// Time of the Moon's highest (transit) or lowest (antitransit) sampled
  /// altitude within the scanned day, refined with a parabolic fit through
  /// the peak sample and its two neighbours.
  static DateTime _findExtremum(
    List<_Sample> samples, {
    required bool findMax,
  }) {
    var bestIndex = 0;

    for (var i = 1; i < samples.length; i++) {
      final better = findMax
          ? samples[i].altitude > samples[bestIndex].altitude
          : samples[i].altitude < samples[bestIndex].altitude;

      if (better) bestIndex = i;
    }

    if (bestIndex == 0 || bestIndex == samples.length - 1) {
      return samples[bestIndex].time;
    }

    final prev = samples[bestIndex - 1];
    final peak = samples[bestIndex];
    final next = samples[bestIndex + 1];

    // Parabolic vertex offset, in units of the (uniform) sample step.
    final denominator = prev.altitude - 2 * peak.altitude + next.altitude;

    final offsetSteps = denominator == 0
        ? 0.0
        : 0.5 * (prev.altitude - next.altitude) / denominator;

    final clamped = offsetSteps.clamp(-1.0, 1.0);

    final offsetMicros = (_sampleStep.inMicroseconds * clamped).round();

    return peak.time.add(Duration(microseconds: offsetMicros));
  }
}

class _Sample {
  final DateTime time;
  final double altitude;

  const _Sample(this.time, this.altitude);
}
