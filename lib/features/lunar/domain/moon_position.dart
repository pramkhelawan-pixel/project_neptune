import 'dart:math';

/// Low-precision geocentric Sun/Moon position formulas (Paul Schlyter's
/// public-domain "How to compute planetary positions", restricted to the
/// terms needed for Moon altitude). Accurate to roughly one arcminute in
/// lunar position, which is more than sufficient for rise/set/transit
/// timing to within a minute or two.
class MoonPosition {
  const MoonPosition._();

  static const _degToRad = pi / 180.0;
  static const _radToDeg = 180.0 / pi;

  /// Geometric altitude (degrees) of the Moon above the horizon for the
  /// given UTC instant and observer location. No refraction correction is
  /// applied here — callers compare against whatever horizon threshold is
  /// appropriate for their use case.
  static double altitudeDegrees({
    required DateTime utc,
    required double latitude,
    required double longitude,
  }) {
    final position = _calculate(utc);

    final utHours = utc.hour + utc.minute / 60.0 + utc.second / 3600.0;
    final gmst0 = _norm(position.lSun + 180.0);
    final gmst = _norm(gmst0 + utHours * 15.0);
    final lst = _norm(gmst + longitude);
    final ha = lst - position.ra;

    final x = cos(_rad(ha)) * cos(_rad(position.dec));
    final y = sin(_rad(ha)) * cos(_rad(position.dec));
    final z = sin(_rad(position.dec));

    final xhor = x * sin(_rad(latitude)) - z * cos(_rad(latitude));
    final zhor = x * cos(_rad(latitude)) + z * sin(_rad(latitude));

    return _deg(atan2(zhor, sqrt(xhor * xhor + y * y)));
  }

  /// Geocentric elongation of the Moon from the Sun, in degrees
  /// (0° = new moon, 180° = full moon). Exposed so this position
  /// calculation can be checked against an independently known
  /// astronomical fact rather than only against itself.
  static double geocentricElongationDegrees(DateTime utc) {
    final position = _calculate(utc);

    return _norm(position.lonecl - position.lSun);
  }

  static _Position _calculate(DateTime utc) {
    final d = _julianDaysSinceEpoch(utc);

    // Sun's orbital elements (needed for sidereal time and for the Moon's
    // main perturbation terms).
    final wSun = _norm(282.9404 + 4.70935e-5 * d);
    final eSun = 0.016709 - 1.151e-9 * d;
    final mSun = _norm(356.0470 + 0.9856002585 * d);

    final eccSun = _solveKepler(mSun, eSun);
    final xvSun = cos(_rad(eccSun)) - eSun;
    final yvSun = sqrt(1 - eSun * eSun) * sin(_rad(eccSun));
    final vSun = _norm(_deg(atan2(yvSun, xvSun)));
    final lSun = _norm(vSun + wSun);

    // Moon's orbital elements.
    final n = _norm(125.1228 - 0.0529538083 * d);
    const i = 5.1454;
    final w = _norm(318.0634 + 0.1643573223 * d);
    const a = 60.2666;
    const e = 0.054900;
    final m = _norm(115.3654 + 13.0649929509 * d);

    final ecc = _solveKepler(m, e);
    final xv = a * (cos(_rad(ecc)) - e);
    final yv = a * sqrt(1 - e * e) * sin(_rad(ecc));
    final r = sqrt(xv * xv + yv * yv);
    final v = _norm(_deg(atan2(yv, xv)));

    final xeclip = r *
        (cos(_rad(n)) * cos(_rad(v + w)) -
            sin(_rad(n)) * sin(_rad(v + w)) * cos(_rad(i)));
    final yeclip = r *
        (sin(_rad(n)) * cos(_rad(v + w)) +
            cos(_rad(n)) * sin(_rad(v + w)) * cos(_rad(i)));
    final zeclip = r * (sin(_rad(v + w)) * sin(_rad(i)));

    var lonecl = _norm(_deg(atan2(yeclip, xeclip)));
    var latecl =
        _deg(atan2(zeclip, sqrt(xeclip * xeclip + yeclip * yeclip)));

    // Main perturbation terms (Evection, Variation, Yearly equation, and
    // the next largest handful) — enough to bring accuracy well under a
    // degree without pulling in the full multi-hundred-term series.
    final mm = m;
    final ms = mSun;
    final lm = _norm(mm + w + n);
    final ls = _norm(ms + wSun);
    final elongation = _norm(lm - ls);
    final f = _norm(lm - n);

    lonecl += -1.274 * sin(_rad(mm - 2 * elongation));
    lonecl += 0.658 * sin(_rad(2 * elongation));
    lonecl += -0.186 * sin(_rad(ms));
    lonecl += -0.059 * sin(_rad(2 * mm - 2 * elongation));
    lonecl += -0.057 * sin(_rad(mm - 2 * elongation + ms));
    lonecl += 0.053 * sin(_rad(mm + 2 * elongation));
    lonecl += 0.046 * sin(_rad(2 * elongation - ms));
    lonecl += 0.041 * sin(_rad(mm - ms));
    lonecl += -0.035 * sin(_rad(elongation));
    lonecl += -0.031 * sin(_rad(mm + ms));
    lonecl += -0.015 * sin(_rad(2 * f - 2 * elongation));
    lonecl += 0.011 * sin(_rad(mm - 4 * elongation));
    lonecl = _norm(lonecl);

    latecl += -0.173 * sin(_rad(f - 2 * elongation));
    latecl += -0.055 * sin(_rad(mm - f - 2 * elongation));
    latecl += -0.046 * sin(_rad(mm + f - 2 * elongation));
    latecl += 0.033 * sin(_rad(f + 2 * elongation));
    latecl += 0.017 * sin(_rad(2 * mm + f));

    // Ecliptic -> equatorial.
    final oblecl = 23.4393 - 3.563e-7 * d;
    final xeq = cos(_rad(lonecl)) * cos(_rad(latecl));
    final yeq = sin(_rad(lonecl)) * cos(_rad(latecl)) * cos(_rad(oblecl)) -
        sin(_rad(latecl)) * sin(_rad(oblecl));
    final zeq = sin(_rad(lonecl)) * cos(_rad(latecl)) * sin(_rad(oblecl)) +
        sin(_rad(latecl)) * cos(_rad(oblecl));

    final ra = _norm(_deg(atan2(yeq, xeq)));
    final dec = _deg(atan2(zeq, sqrt(xeq * xeq + yeq * yeq)));

    return _Position(ra: ra, dec: dec, lonecl: lonecl, lSun: lSun);
  }

  static double _solveKepler(double mDeg, double e) {
    final mRad = _rad(mDeg);
    var ecc = mDeg + _radToDeg * e * sin(mRad) * (1 + e * cos(mRad));

    for (var iteration = 0; iteration < 8; iteration++) {
      final eccRad = _rad(ecc);
      final delta = (ecc - _radToDeg * e * sin(eccRad) - mDeg) /
          (1 - e * cos(eccRad));

      ecc -= delta;

      if (delta.abs() < 0.0001) break;
    }

    return ecc;
  }

  static double _julianDaysSinceEpoch(DateTime utc) {
    var y = utc.year;
    var m = utc.month;

    final dayFraction = utc.day +
        (utc.hour + utc.minute / 60.0 + utc.second / 3600.0) / 24.0;

    if (m <= 2) {
      y -= 1;
      m += 12;
    }

    final a = (y / 100).floor();
    final b = 2 - a + (a / 4).floor();

    final julianDate = (365.25 * (y + 4716)).floor() +
        (30.6001 * (m + 1)).floor() +
        dayFraction +
        b -
        1524.5;

    // Days since 1999-12-31T00:00Z, the epoch these orbital elements are
    // referenced to.
    return julianDate - 2451543.5;
  }

  static double _rad(double deg) => deg * _degToRad;
  static double _deg(double rad) => rad * _radToDeg;
  static double _norm(double deg) => deg - 360.0 * (deg / 360.0).floor();
}

class _Position {
  final double ra;
  final double dec;
  final double lonecl;
  final double lSun;

  const _Position({
    required this.ra,
    required this.dec,
    required this.lonecl,
    required this.lSun,
  });
}
