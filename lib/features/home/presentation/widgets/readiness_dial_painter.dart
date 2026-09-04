import 'dart:math';

import 'package:flutter/material.dart';

/// Paints the Readiness dial's ring, glow, and tick marks — the score/rating
/// text is layered on top separately (see [ReadinessCard]) rather than
/// painted here, so it stays crisp and themeable.
///
/// The fill ring is always the brand gold, never color-coded by score —
/// deliberate, per the approved Abyssal Gold pitch: "the dial's brass never
/// changes hue; it's the instrument's material, always premium." Only the
/// status pill next to the dial carries the semantic rating color.
///
/// Colours are passed in (from [ReadinessCard], which reads
/// `context.colors`) rather than read from a static [AppColors] here, so
/// the dial renders correctly in both light and dark mode without this
/// painter needing a [BuildContext] of its own. Geometry (radius, arc,
/// stroke widths, tick count) is unchanged from the pre-theming version.
class ReadinessDialPainter extends CustomPainter {
  final double sweepFraction;
  final Color trackColor;
  final Color tickColor;
  final Color glowColor;
  final Color fillColor;

  const ReadinessDialPainter({
    required this.sweepFraction,
    required this.trackColor,
    required this.tickColor,
    required this.glowColor,
    required this.fillColor,
  });

  static const double _ringRadius = 92;
  static const double _canvasRadius = 110;
  static const int _tickCount = 40;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final scale = size.width / (_canvasRadius * 2);
    final radius = _ringRadius * scale;

    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10 * scale;
    canvas.drawCircle(center, radius, trackPaint);

    final tickPaint = Paint()
      ..color = tickColor.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < _tickCount; i++) {
      final angle = (i / _tickCount) * 2 * pi;
      final isMajor = i % 5 == 0;

      final r1 = 78 * scale;
      final r2 = (isMajor ? 70 : 74) * scale;

      tickPaint.strokeWidth = (isMajor ? 1.6 : 1.0) * scale;

      final p1 = Offset(
        center.dx + r1 * cos(angle),
        center.dy + r1 * sin(angle),
      );
      final p2 = Offset(
        center.dx + r2 * cos(angle),
        center.dy + r2 * sin(angle),
      );

      canvas.drawLine(p1, p2, tickPaint);
    }

    if (sweepFraction <= 0) {
      return;
    }

    final rect = Rect.fromCircle(center: center, radius: radius);
    final sweepAngle = sweepFraction * 2 * pi;
    const startAngle = -pi / 2;

    final glowPaint = Paint()
      ..color = glowColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14 * scale
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    canvas.drawArc(rect, startAngle, sweepAngle, false, glowPaint);

    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10 * scale
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(rect, startAngle, sweepAngle, false, fillPaint);
  }

  @override
  bool shouldRepaint(covariant ReadinessDialPainter oldDelegate) =>
      oldDelegate.sweepFraction != sweepFraction ||
      oldDelegate.trackColor != trackColor ||
      oldDelegate.tickColor != tickColor ||
      oldDelegate.glowColor != glowColor ||
      oldDelegate.fillColor != fillColor;
}
