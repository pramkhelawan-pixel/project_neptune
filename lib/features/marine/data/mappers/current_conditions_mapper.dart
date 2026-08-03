import '../../domain/value_objects/current_conditions.dart';

class CurrentConditionsMapper {
  const CurrentConditionsMapper._();

  static CurrentConditions toDomain() {
    return const CurrentConditions(
      speed: 0.0,
      direction: 'Unknown',
    );
  }
}