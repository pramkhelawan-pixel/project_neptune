// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: marine_repository.dart
//
// Purpose:
// Defines the authoritative contract for accessing marine observations
// throughout Neptune.
//
// This repository represents the single entry point into the Marine Domain.
//
// Implementations may retrieve data from:
//
// • Open-Meteo
// • Stormglass
// • SA Weather Service
// • Local cache
// • Supabase
// • Mock repositories
//
// Consumers:
//
// • Intelligence Engine
// • Recommendation Engine
// • Analytics
// • AI
//
// -----------------------------------------------------------------------------

import '../entities/marine_conditions.dart';
import '../value_objects/location_conditions.dart';

/// Contract for retrieving marine observations.
///
/// Implementations are responsible for obtaining marine data from one or more
/// external or internal data sources.
///
/// The domain layer depends only on this contract and remains independent of
/// implementation details.
abstract class MarineRepository {
  const MarineRepository();

  // ---------------------------------------------------------------------------
  // Current Conditions
  // ---------------------------------------------------------------------------

  /// Returns the latest available marine conditions for a location.
  Future<MarineConditions> getCurrentConditions({
    required LocationConditions location,
  });

  // ---------------------------------------------------------------------------
  // Forecast
  // ---------------------------------------------------------------------------

  /// Returns forecast marine conditions.
  Future<List<MarineConditions>> getForecast({
    required LocationConditions location,
    required Duration duration,
  });

  // ---------------------------------------------------------------------------
  // Historical Conditions
  // ---------------------------------------------------------------------------

  /// Returns historical marine observations.
  Future<List<MarineConditions>> getHistory({
    required LocationConditions location,
    required DateTime from,
    required DateTime to,
  });

  // ---------------------------------------------------------------------------
  // Refresh
  // ---------------------------------------------------------------------------

  /// Refreshes cached marine observations.
  Future<void> refresh({
    required LocationConditions location,
  });
}