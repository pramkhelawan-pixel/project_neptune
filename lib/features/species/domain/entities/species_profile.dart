// -----------------------------------------------------------------------------
// Neptune Marine Intelligence Platform
// -----------------------------------------------------------------------------
// File: species_profile.dart
//
// Purpose:
// Represents the environmental preferences of a fish species.
//
// Neptune uses this profile to compare live marine conditions against the
// preferred conditions for each species.
// -----------------------------------------------------------------------------

class SpeciesProfile {
  /// Preferred wind speed range (km/h).
  final double minimumWindSpeed;
  final double maximumWindSpeed;

  /// Preferred swell height range (m).
  final double minimumSwellHeight;
  final double maximumSwellHeight;

  /// Preferred water temperature (°C).
  final double minimumWaterTemperature;
  final double maximumWaterTemperature;

  /// Preferred atmospheric pressure (hPa).
  final double minimumPressure;
  final double maximumPressure;

  /// Preferred moon phases.
  final List<String> preferredMoonPhases;

  const SpeciesProfile({
    required this.minimumWindSpeed,
    required this.maximumWindSpeed,
    required this.minimumSwellHeight,
    required this.maximumSwellHeight,
    required this.minimumWaterTemperature,
    required this.maximumWaterTemperature,
    required this.minimumPressure,
    required this.maximumPressure,
    required this.preferredMoonPhases,
  });

  bool prefersMoonPhase(
      String moonPhase,
      ) {
    return preferredMoonPhases
        .map((phase) => phase.toLowerCase())
        .contains(moonPhase.toLowerCase());
  }
}