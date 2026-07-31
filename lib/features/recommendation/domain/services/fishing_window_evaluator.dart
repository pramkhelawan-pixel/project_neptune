import '../../../marine/domain/models/marine_conditions.dart';

/// Represents Neptune's recommended fishing window.
class FishingWindow {
  final DateTime start;
  final DateTime end;

  const FishingWindow({
    required this.start,
    required this.end,
  });
}

/// Calculates the best fishing window based on tide data.
///
/// Version 1 uses a simple rule:
/// - Start one hour before high tide.
/// - End one hour after high tide.
///
/// Future versions will include:
/// • Species behaviour
/// • Moon phase
/// • Pressure trend
/// • Historical catch data
class FishingWindowEvaluator {
  const FishingWindowEvaluator();

  FishingWindow? evaluate(
      MarineConditions marine,
      ) {
    final highTide = marine.nextHighTide;

    if (highTide == null) {
      return null;
    }

    return FishingWindow(
      start: highTide.subtract(
        const Duration(hours: 1),
      ),
      end: highTide.add(
        const Duration(hours: 1),
      ),
    );
  }
}