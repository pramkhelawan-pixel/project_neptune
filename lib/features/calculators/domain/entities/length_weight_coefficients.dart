import 'length_type.dart';

/// A species-specific length-weight relationship: `W = a * L^b`.
///
/// Every field here must be sourced directly from a cited, peer-reviewed
/// (or otherwise authoritative, primary-source-verified) study -- never
/// invented, inferred, or averaged. See [sourceCitation].
class LengthWeightCoefficients {
  /// Matches the existing Neptune species catalogue's `Species.id`
  /// (lib/features/species/domain/species.dart) -- not a separate
  /// identifier space.
  final String speciesId;

  final String scientificName;
  final String displayName;

  final double a;
  final double b;

  /// The length measurement type the study fitted [a]/[b] against.
  final LengthType lengthType;

  /// The unit [a]/[b] expect [minValidatedLengthCm]/[maxValidatedLengthCm]
  /// and any input length to already be converted into. Always 'cm' for
  /// the current V1 dataset.
  final String lengthUnit;

  /// The unit the raw calculation result (`a * L^b`) is expressed in
  /// before any kg conversion for display. Always 'g' for the current V1
  /// dataset.
  final String weightUnit;

  /// The length range (in [lengthUnit]) the source study actually
  /// observed. A length outside this range would require extrapolating
  /// beyond the validated data, not interpolating within it.
  final double minValidatedLengthCm;
  final double maxValidatedLengthCm;

  final int sampleSize;
  final double rSquared;

  final String sourceCitation;

  const LengthWeightCoefficients({
    required this.speciesId,
    required this.scientificName,
    required this.displayName,
    required this.a,
    required this.b,
    required this.lengthType,
    required this.lengthUnit,
    required this.weightUnit,
    required this.minValidatedLengthCm,
    required this.maxValidatedLengthCm,
    required this.sampleSize,
    required this.rSquared,
    required this.sourceCitation,
  });

  bool isWithinValidatedRange(double lengthCm) {
    return lengthCm >= minValidatedLengthCm &&
        lengthCm <= maxValidatedLengthCm;
  }
}
