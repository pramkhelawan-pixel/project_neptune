import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../readiness/domain/readiness_engine.dart';
import 'readiness_dial_painter.dart';

class ReadinessCard extends StatelessWidget {
  final ReadinessResult result;

  const ReadinessCard({
    super.key,
    required this.result,
  });

  Color _ratingColor() {
    if (result.score >= 70) {
      return AppColors.success;
    }

    if (result.score >= 50) {
      return AppColors.warning;
    }

    return AppColors.critical;
  }

  @override
  Widget build(BuildContext context) {
    final ratingColor = _ratingColor();

    return Card(
      color: AppColors.surface1,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: AppColors.hairline),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Neptune Readiness',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
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
                    CustomPaint(
                      size: const Size(220, 220),
                      painter: ReadinessDialPainter(
                        sweepFraction: result.score / 100,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${result.score}%',
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
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
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
            ),

            const SizedBox(height: 24),

            const Divider(color: AppColors.hairline),

            const SizedBox(height: 8),

            const Text(
              'Why?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 12),

            ...result.reasons.map(
              (reason) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: AppColors.brass,
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        reason,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
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
