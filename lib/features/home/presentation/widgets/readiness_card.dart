import 'package:flutter/material.dart';

import '../../../../core/theme/pelav_colors.dart';
import '../../../readiness/domain/readiness_engine.dart';
import 'readiness_dial_painter.dart';

class ReadinessCard extends StatelessWidget {
  final ReadinessResult result;

  const ReadinessCard({
    super.key,
    required this.result,
  });

  static const Curve _dialCurve = Cubic(0.22, 0.9, 0.3, 1.0);

  Color _ratingColor(PelavColors colors) {
    if (result.score >= 70) {
      return colors.success;
    }

    if (result.score >= 50) {
      return colors.warning;
    }

    return colors.critical;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final ratingColor = _ratingColor(colors);

    // Background/border/radius/elevation are inherited from CardThemeData
    // (surface1, 1px hairline, 18px radius, elevation 0) rather than
    // repeated here.
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'PELAV Readiness',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: colors.textPrimary,
              ),
            ),

            const SizedBox(height: 24),

            Center(
              child: SizedBox(
                width: 220,
                height: 220,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: result.score / 100),
                      duration: const Duration(milliseconds: 700),
                      curve: _dialCurve,
                      builder: (context, sweepFraction, child) {
                        return CustomPaint(
                          size: const Size(220, 220),
                          painter: ReadinessDialPainter(
                            sweepFraction: sweepFraction,
                            trackColor: colors.surface3,
                            tickColor: colors.textTertiary,
                            glowColor: colors.primaryBright,
                            fillColor: colors.primaryForeground,
                          ),
                        );
                      },
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${result.score}%',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: colors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          result.rating,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: ratingColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              result.recommendation,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: colors.textSecondary,
              ),
            ),

            const SizedBox(height: 24),

            Divider(color: colors.hairline),

            const SizedBox(height: 8),

            Text(
              'Why?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: colors.textPrimary,
              ),
            ),

            const SizedBox(height: 12),

            ...result.reasons.map(
              (reason) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: colors.primaryForeground,
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        reason,
                        style: TextStyle(
                          color: colors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
