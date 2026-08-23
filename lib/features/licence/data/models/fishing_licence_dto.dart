/// JSON shape persisted to local storage (SharedPreferences) for the
/// stored fishing licence.
class FishingLicenceDto {
  final String pdfPath;
  final String anglerName;
  final String licenceNumber;
  final String issuingAuthority;
  final String validFrom;
  final String expiryDate;
  final String? originalFileName;

  const FishingLicenceDto({
    required this.pdfPath,
    required this.anglerName,
    required this.licenceNumber,
    required this.issuingAuthority,
    required this.validFrom,
    required this.expiryDate,
    this.originalFileName,
  });

  factory FishingLicenceDto.fromJson(Map<String, dynamic> json) {
    return FishingLicenceDto(
      pdfPath: json['pdf_path'] as String,
      anglerName: json['angler_name'] as String,
      licenceNumber: json['licence_number'] as String,
      issuingAuthority: json['issuing_authority'] as String,
      validFrom: json['valid_from'] as String,
      expiryDate: json['expiry_date'] as String,
      originalFileName: json['original_file_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pdf_path': pdfPath,
      'angler_name': anglerName,
      'licence_number': licenceNumber,
      'issuing_authority': issuingAuthority,
      'valid_from': validFrom,
      'expiry_date': expiryDate,
      'original_file_name': originalFileName,
    };
  }
}
