import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

/// The PELAV wordmark treatment shown on Login. The old Neptune waves glyph
/// that previously appeared above the wordmark has been removed -- the
/// approved PELAV identity is wordmark-led with a distinctive geometric
/// treatment integrated into the letter A, not a separate device mark.
/// That production mark is not yet available in this project; until it is
/// supplied, this widget renders the wordmark (and optional tagline) alone
/// rather than approximating or inventing a replacement symbol.
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
        Text(
          'PELAV',
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