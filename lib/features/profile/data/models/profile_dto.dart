/// Row shape for the Supabase `profiles` table.
class ProfileDto {
  final String id;
  final bool isPremium;
  final DateTime createdAt;

  const ProfileDto({
    required this.id,
    required this.isPremium,
    required this.createdAt,
  });

  factory ProfileDto.fromJson(Map<String, dynamic> json) {
    return ProfileDto(
      id: json['id'] as String,
      isPremium: json['is_premium'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
}
