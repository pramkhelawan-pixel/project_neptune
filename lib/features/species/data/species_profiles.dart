import 'garrick_profile.dart';
import 'kob_profile.dart';

import '../domain/entities/species_profile.dart';

/// Initial Neptune profile catalogue.
///
/// IMPORTANT:
/// The order of this list must match species_catalog.dart.
const List<SpeciesProfile> speciesProfiles = [
  kobProfile,
  garrickProfile,
];