import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class NeptuneLogo extends StatelessWidget {
  const NeptuneLogo({
    super.key,
    this.showSubtitle = true,
  });

  final bool showSubtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.waves,
          size: 72,
          color: AppColors.primary,
        ),
        const SizedBox(height: 16),
        Text(
          'Neptune',
          style: AppTextStyles.displayLarge,
        ),
        if (showSubtitle) ...[
          const SizedBox(height: 8),
          Text(
            'South African Coastal Angling',
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}