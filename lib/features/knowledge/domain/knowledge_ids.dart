// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: knowledge_ids.dart
// Purpose:
// Defines permanent prefixes for every Neptune knowledge domain.
// These IDs never change and are used throughout the platform.
// -----------------------------------------------------------------------------

/// Neptune Knowledge Standard (NKS)
abstract final class KnowledgeIds {
  const KnowledgeIds._();

  // Species
  static const String species = 'NKR-SPC';

  // Bait
  static const String bait = 'NKR-BAIT';

  // Bait preparation
  static const String baitPreparation = 'NKR-BAIT-PREP';

  // Bait presentation
  static const String baitPresentation = 'NKR-BAIT-PRES';

  // Traces
  static const String trace = 'NKR-TRACE';

  // Knots
  static const String knot = 'NKR-KNOT';

  // Hooks
  static const String hook = 'NKR-HOOK';

  // Sinkers
  static const String sinker = 'NKR-SINKER';

  // Beaches
  static const String beach = 'NKR-BEACH';

  // Techniques
  static const String technique = 'NKR-TECH';

  // Regulations
  static const String regulation = 'NKR-REG';

  // Safety
  static const String safety = 'NKR-SAFE';

  // Marine Conditions
  static const String marine = 'NKR-MARINE';
}