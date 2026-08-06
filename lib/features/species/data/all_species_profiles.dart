import '../domain/species.dart';

import 'black_musselcracker_species_profile.dart';
import 'blacktail_species_profile.dart';
import 'bronze_bream_species_profile.dart';
import 'bronze_whaler_species_profile.dart';
import 'diamond_ray_species_profile.dart';
import 'duckbill_ray_species_profile.dart';
import 'eagle_ray_species_profile.dart';
import 'galjoen_species_profile.dart';
import 'garrick_species_profile.dart';
import 'grunter_species_profile.dart';
import 'guitarfish_species_profile.dart';
import 'karanteen_species_profile.dart';
import 'kob_species_profile.dart';
import 'raggedtooth_shark_species_profile.dart';
import 'shad_profile.dart';
import 'smoothhound_shark_species_profile.dart';
import 'spotted_gully_shark_species_profile.dart';
import 'springer_species_profile.dart';
import 'stumpnose_species_profile.dart';
import 'white_steenbras_species_profile.dart';
import 'zebra_species_profile.dart';

/// Every edible species profile known to Neptune.
///
/// Shad is the reference species (see ROADMAP.md); every other profile
/// follows the same knowledge standard. This list feeds the daily
/// recommendation engine, so only table species belong here.
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

/// Every non-edible (catch-and-release sport) species profile known to
/// Neptune: sharks and rays targeted for the fight rather than the table.
const List<Species> nonEdibleSpeciesProfiles = [
  spottedGullySharkSpeciesProfile,
  raggedtoothSharkSpeciesProfile,
  bronzeWhalerSpeciesProfile,
  smoothhoundSharkSpeciesProfile,
  duckbillRaySpeciesProfile,
  eagleRaySpeciesProfile,
  diamondRaySpeciesProfile,
  guitarfishSpeciesProfile,
];
