// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: knowledge_tags.dart
// Purpose:
// Standardised tags used throughout the Neptune Knowledge Repository.
// These controlled values ensure consistency across all knowledge records.
// -----------------------------------------------------------------------------

/// Controlled vocabulary for the Neptune Knowledge Repository.
///
/// Tags should never be created ad hoc. Every knowledge record should use
/// these constants wherever applicable.
abstract final class KnowledgeTags {
  const KnowledgeTags._();

  // ---------------------------------------------------------------------------
  // Species
  // ---------------------------------------------------------------------------

  static const String shad = 'shad';
  static const String kob = 'kob';
  static const String bronzeBream = 'bronze_bream';
  static const String garrick = 'garrick';
  static const String stumpnose = 'stumpnose';
  static const String blacktail = 'blacktail';

  // ---------------------------------------------------------------------------
  // Bait
  // ---------------------------------------------------------------------------

  static const String naturalBait = 'natural_bait';
  static const String artificialLure = 'artificial_lure';
  static const String liveBait = 'live_bait';
  static const String cutBait = 'cut_bait';

  static const String sardine = 'sardine';
  static const String chokka = 'chokka';
  static const String pinkPrawn = 'pink_prawn';
  static const String redeye = 'redeye';
  static const String mackerel = 'mackerel';

  // ---------------------------------------------------------------------------
  // Water
  // ---------------------------------------------------------------------------

  static const String cleanWater = 'clean_water';
  static const String greenWater = 'green_water';
  static const String dirtyWater = 'dirty_water';

  // ---------------------------------------------------------------------------
  // Tide
  // ---------------------------------------------------------------------------

  static const String incoming = 'incoming';
  static const String outgoing = 'outgoing';
  static const String high = 'high';
  static const String low = 'low';

  // ---------------------------------------------------------------------------
  // Wind
  // ---------------------------------------------------------------------------

  static const String north = 'north';
  static const String northEast = 'north_east';
  static const String east = 'east';
  static const String southEast = 'south_east';
  static const String south = 'south';
  static const String southWest = 'south_west';
  static const String west = 'west';
  static const String northWest = 'north_west';

  // ---------------------------------------------------------------------------
  // Seasons
  // ---------------------------------------------------------------------------

  static const String summer = 'summer';
  static const String autumn = 'autumn';
  static const String winter = 'winter';
  static const String spring = 'spring';

  // ---------------------------------------------------------------------------
  // Time
  // ---------------------------------------------------------------------------

  static const String dawn = 'dawn';
  static const String morning = 'morning';
  static const String afternoon = 'afternoon';
  static const String dusk = 'dusk';
  static const String night = 'night';

  // ---------------------------------------------------------------------------
  // Terrain
  // ---------------------------------------------------------------------------

  static const String sand = 'sand';
  static const String reef = 'reef';
  static const String gullies = 'gullies';
  static const String rocks = 'rocks';
  static const String estuary = 'estuary';
  static const String harbour = 'harbour';

  // ---------------------------------------------------------------------------
  // Skill
  // ---------------------------------------------------------------------------

  static const String beginner = 'beginner';
  static const String intermediate = 'intermediate';
  static const String advanced = 'advanced';
  static const String expert = 'expert';

  // ---------------------------------------------------------------------------
  // Techniques
  // ---------------------------------------------------------------------------

  static const String throwBait = 'throw_bait';
  static const String scratching = 'scratching';
  static const String spinning = 'spinning';
  static const String sliding = 'sliding';
}