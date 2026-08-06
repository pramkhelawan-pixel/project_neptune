import '../domain/species.dart';

import 'black_musselcracker_species_profile.dart';
import 'blacktail_species_profile.dart';
import 'bronze_bream_species_profile.dart';
import 'galjoen_species_profile.dart';
import 'garrick_species_profile.dart';
import 'grunter_species_profile.dart';
import 'karanteen_species_profile.dart';
import 'kob_species_profile.dart';
import 'shad_profile.dart';
import 'springer_species_profile.dart';
import 'stumpnose_species_profile.dart';
import 'white_steenbras_species_profile.dart';
import 'zebra_species_profile.dart';

/// Every species profile known to Neptune.
///
/// Shad is the reference species (see ROADMAP.md); every other profile
/// follows the same knowledge standard.
const List<Species> allSpeciesProfiles = [
  shadProfile,
  garrickSpeciesProfile,
  kobSpeciesProfile,
  bronzeBreamSpeciesProfile,
  blacktailSpeciesProfile,
  stumpnoseSpeciesProfile,
  galjoenSpeciesProfile,
  grunterSpeciesProfile,
  whiteSteenbrasSpeciesProfile,
  blackMusselcrackerSpeciesProfile,
  zebraSpeciesProfile,
  karanteenSpeciesProfile,
  springerSpeciesProfile,
];
