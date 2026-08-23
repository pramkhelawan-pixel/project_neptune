/// Thrown when a selected file fails PDF validation (its content does not
/// start with the standard `%PDF-` header), regardless of its extension.
class InvalidPdfException implements Exception {
  final String message;

  const InvalidPdfException(this.message);

  @override
  String toString() => 'InvalidPdfException: $message';
}
