// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: species.dart
// Purpose:
// Core species domain model used throughout the Neptune Species Intelligence
// System.
// -----------------------------------------------------------------------------

class Species {
  /// Unique Neptune Species Identifier.
  final String id;

  /// Common South African name.
  final String name;

  /// Scientific (Latin) name.
  final String scientificName;

  /// Alternative local names.
  final List<String> aliases;

  /// Preferred tide states.
  final List<String> preferredTides;

  /// Preferred wind directions.
  final List<String> preferredWindDirections;

  /// Minimum fishable wind speed.
  final double minWindSpeed;

  /// Maximum fishable wind speed.
  final double maxWindSpeed;

  /// Minimum preferred swell height.
  final double minSwellHeight;

  /// Maximum preferred swell height.
  final double maxSwellHeight;

  /// Preferred moon phases.
  final List<String> preferredMoonPhases;

  /// Best fishing time.
  final String preferredTime;

  /// Recommended natural bait.
  final String recommendedBait;

  /// Recommended artificial lure.
  final String recommendedLure;

  /// Recommended trace.
  final String recommendedTrace;

  /// Recommended hook sizes.
  final List<String> recommendedHookSizes;

  /// Preferred water colour.
  final String preferredWaterColour;

  /// Preferred water temperature.
  final String preferredWaterTemperature;

  /// Typical habitat.
  final List<String> habitats;

  /// Distribution along the coastline.
  final List<String> distribution;

  /// Best fishing seasons.
  final List<String> seasons;

  /// General feeding behaviour.
  final String feedingBehaviour;

  /// Additional expert notes.
  final String notes;

  const Species({
    required this.id,
    required this.name,
    required this.scientificName,
    this.aliases = const [],
    required this.preferredTides,
    required this.preferredWindDirections,
    required this.minWindSpeed,
    required this.maxWindSpeed,
    required this.minSwellHeight,
    required this.maxSwellHeight,
    required this.preferredMoonPhases,
    required this.preferredTime,
    required this.recommendedBait,
    required this.recommendedLure,
    this.recommendedTrace = '',
    this.recommendedHookSizes = const [],
    this.preferredWaterColour = '',
    this.preferredWaterTemperature = '',
    this.habitats = const [],
    this.distribution = const [],
    this.seasons = const [],
    this.feedingBehaviour = '',
    required this.notes,
  });
}