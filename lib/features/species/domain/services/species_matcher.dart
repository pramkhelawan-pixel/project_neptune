// -----------------------------------------------------------------------------
// Neptune Marine Intelligence Platform
// -----------------------------------------------------------------------------
// File: species_matcher.dart
//
// Purpose:
// Calculates how well current marine conditions match a species profile.
//
// This service forms the basis of Neptune's species-specific recommendation
// engine. Future versions will include weighted scoring, seasonal behaviour,
// historical catches and machine learning.
// -----------------------------------------------------------------------------

import '../../../marine/domain/models/marine_conditions.dart';

import '../entities/species_profile.dart';

/// Matches live marine conditions against a species profile.
class SpeciesMatcher {
  const SpeciesMatcher();

  /// Returns a suitability score between 0 and 100.
  int calculateScore({
    required MarineConditions marine,
    required SpeciesProfile profile,
  }) {
    int score = 100;

    //----------------------------------------------------------------------
    // Wind
    //----------------------------------------------------------------------

    if (marine.windSpeed < profile.minimumWindSpeed ||
        marine.windSpeed > profile.maximumWindSpeed) {
      score -= 20;
    }

    //----------------------------------------------------------------------
    // Swell
    //----------------------------------------------------------------------

    if (marine.swellHeight < profile.minimumSwellHeight ||
        marine.swellHeight > profile.maximumSwellHeight) {
      score -= 20;
    }

    //----------------------------------------------------------------------
    // Water Temperature
    //----------------------------------------------------------------------

    if (marine.waterTemperature < profile.minimumWaterTemperature ||
        marine.waterTemperature > profile.maximumWaterTemperature) {
      score -= 20;
    }

    //----------------------------------------------------------------------
    // Atmospheric Pressure
    //----------------------------------------------------------------------

    if (marine.atmosphericPressure < profile.minimumPressure ||
        marine.atmosphericPressure > profile.maximumPressure) {
      score -= 20;
    }

    //----------------------------------------------------------------------
    // Moon Phase
    //----------------------------------------------------------------------

    if (!profile.prefersMoonPhase(
      marine.moonPhase,
    )) {
      score -= 20;
    }

    //----------------------------------------------------------------------
    // Clamp
    //----------------------------------------------------------------------

    if (score < 0) {
      score = 0;
    }

    return score;
  }
}