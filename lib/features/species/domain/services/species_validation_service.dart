import '../entities/species_reference.dart';

/// Determines whether a species knowledge record has reached
/// Neptune's publication standard.
class SpeciesValidationService {
  const SpeciesValidationService();

  bool isVerified(
      List<SpeciesReference> references,
      ) {
    for (final reference in references) {
      if (reference.confidence.name == 'verified') {
        return true;
      }
    }

    return false;
  }
}