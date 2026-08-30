/// Shared user-facing copy for the Length-to-Weight calculator, kept in
/// one place so wording stays consistent across the Profile entry point
/// and the calculator page.
const kLengthWeightCalculatorName = 'Length-to-Weight';

const kLengthWeightCalculatorSubtitle =
    'Estimate fish weight from measured length';

/// Required scientific disclaimer -- every V1 coefficient is fitted to
/// Standard Length, not Total Length, and the two are not interchangeable.
const kLengthWeightMeasurementDisclaimer =
    'Estimate based on Standard Length (SL), not Total Length (TL).';

const kLengthWeightScientificDisclaimer =
    'This is a statistical estimate, not a measured weight. It is only '
    "shown within the length range the underlying study actually "
    "observed -- Neptune does not extrapolate beyond it. This is not a "
    'substitute for weighing the fish.';

/// Source attribution shown alongside the disclaimers above -- the exact
/// citation for the coefficients in
/// lib/features/calculators/data/length_weight_coefficients_table.dart.
const kLengthWeightSourceAttribution =
    'Source: Harrison, T.D. (2001), "Length-weight relationships of '
    'fishes from South African estuaries", Journal of Applied '
    'Ichthyology 17:46-48. DOI: 10.1046/j.1439-0426.2001.00277.x';
