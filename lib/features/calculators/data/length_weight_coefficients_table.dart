import '../domain/entities/length_type.dart';
import '../domain/entities/length_weight_coefficients.dart';

/// Harrison, T.D. (2001), "Length-weight relationships of fishes from
/// South African estuaries", Journal of Applied Ichthyology 17:46-48.
/// DOI: 10.1046/j.1439-0426.2001.00277.x. Table 1, pp.46-48.
///
/// Verified directly against the primary-source full text (CSIR
/// ResearchSpace institutional repository, handle 10204/2155) -- these
/// three species' a/b/n/r-squared/length-range values were read from the
/// paper's own table, not taken second-hand from a compiled database.
const kHarrison2001Citation =
    'Harrison, T.D. (2001), "Length-weight relationships of fishes from '
    'South African estuaries", Journal of Applied Ichthyology 17:46-48. '
    'DOI: 10.1046/j.1439-0426.2001.00277.x';

/// Every length-weight relationship Neptune's calculator currently
/// supports. Only add a species here once its equation has been verified
/// against a primary source the same way these three were -- see
/// [kHarrison2001Citation].
///
/// Keyed by `speciesId` matching the existing Neptune species catalogue
/// (lib/features/species/domain/species.dart) -- deliberately not a
/// separate identifier space.
const List<LengthWeightCoefficients> lengthWeightCoefficientsTable = [
  LengthWeightCoefficients(
    speciesId: 'stumpnose',
    scientificName: 'Rhabdosargus holubi',
    displayName: 'Stumpnose',
    a: 0.0272,
    b: 3.087,
    lengthType: LengthType.standardLength,
    lengthUnit: 'cm',
    weightUnit: 'g',
    minValidatedLengthCm: 1.1,
    maxValidatedLengthCm: 24.0,
    sampleSize: 1335,
    rSquared: 0.993,
    sourceCitation: kHarrison2001Citation,
  ),
  LengthWeightCoefficients(
    speciesId: 'grunter',
    scientificName: 'Pomadasys commersonnii',
    displayName: 'Grunter',
    a: 0.0209,
    b: 3.001,
    lengthType: LengthType.standardLength,
    lengthUnit: 'cm',
    weightUnit: 'g',
    minValidatedLengthCm: 1.4,
    maxValidatedLengthCm: 64.0,
    sampleSize: 917,
    rSquared: 0.997,
    sourceCitation: kHarrison2001Citation,
  ),
  LengthWeightCoefficients(
    speciesId: 'blacktail',
    scientificName: 'Diplodus capensis',
    displayName: 'Blacktail',
    a: 0.0276,
    b: 3.081,
    lengthType: LengthType.standardLength,
    lengthUnit: 'cm',
    weightUnit: 'g',
    minValidatedLengthCm: 1.1,
    maxValidatedLengthCm: 22.0,
    sampleSize: 369,
    rSquared: 0.993,
    sourceCitation: kHarrison2001Citation,
  ),
];
