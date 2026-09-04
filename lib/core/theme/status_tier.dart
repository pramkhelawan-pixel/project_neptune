import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'pelav_colors.dart';

/// Semantic status severity — success/warning/critical — used to resolve a
/// consistent [Color] wherever the app shows a rating, score, or
/// confidence level.
///
/// This represents severity only. It does **not** define business
/// thresholds: Readiness (70/50), Environmental Readiness (90/75/60),
/// Recommendation confidence (85/70/50), and Best Fishing Window's
/// qualitative mapping all retain their own existing cutoffs in their own
/// domain/presentation code, exactly as before this helper existed. This
/// type exists solely so every consumer that already knows its own tier
/// resolves that tier to the same [Color], instead of each screen
/// hardcoding its own `Colors.green`/`Colors.orange`/`Colors.red`.
enum StatusTier {
  success,
  warning,
  critical;

  /// The semantic [AppColors] token for this tier. Never a brand colour
  /// (e.g. [AppColors.accent]/Ocean Blue) — status severity and brand
  /// identity are deliberately kept separate.
  Color get color {
    switch (this) {
      case StatusTier.success:
        return AppColors.success;
      case StatusTier.warning:
        return AppColors.warning;
      case StatusTier.critical:
        return AppColors.critical;
    }
  }

  /// Theme-aware equivalent of [color] -- resolves against the active
  /// theme's [PelavColors] instead of the dark-only [AppColors] statics, so
  /// callers render correctly in both light and dark mode. [color] itself
  /// is left untouched (still dark-only) since it's part of this type's
  /// existing tested API.
  Color resolve(BuildContext context) {
    final colors = context.colors;
    switch (this) {
      case StatusTier.success:
        return colors.success;
      case StatusTier.warning:
        return colors.warning;
      case StatusTier.critical:
        return colors.critical;
    }
  }

  /// Resolves a Species Recommendation score (0-100) to a [StatusTier],
  /// preserving the existing 80/60/40 cutoffs used by
  /// `SpeciesRecommendationCard` exactly as-is:
  ///   >=80 -> success, 60-79 -> success, 40-59 -> warning, <40 -> critical.
  ///
  /// This corrects the pre-PELAV mismatch where the card's colour logic
  /// had only 3 buckets (green/orange/red) while its qualitative label
  /// ('Excellent'/'Good'/'Fair'/'Poor') had 4 — Fair (40-59) and Poor
  /// (<40) rendered identically coloured despite different labels. The
  /// cutoff values themselves are unchanged; only the number of colour
  /// buckets now matches the number of label buckets.
  ///
  /// Not yet wired into any screen — call sites are migrated in a later
  /// step.
  static StatusTier forSpeciesScore(int score) {
    if (score >= 60) return StatusTier.success;
    if (score >= 40) return StatusTier.warning;
    return StatusTier.critical;
  }
}
