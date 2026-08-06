import '../../domain/models/marine_conditions.dart';
import '../models/tide_dto.dart';

class TideMapper {
  const TideMapper._();

  static MarineConditions toDomain({
    required MarineConditions currentConditions,
    required TideDto tide,
  }) {
    final now = DateTime.now().toUtc();

    final currentHeight = _currentHeight(
      tide.heights,
      now,
    );

    TideExtremeDto? nextHigh;
    TideExtremeDto? nextLow;

    for (final extreme in tide.extremes) {
      if (extreme.dateTime.isAfter(now)) {
        if (nextHigh == null && extreme.isHigh) {
          nextHigh = extreme;
        }

        if (nextLow == null && extreme.isLow) {
          nextLow = extreme;
        }

        if (nextHigh != null && nextLow != null) {
          break;
        }
      }
    }

    return currentConditions.copyWith(
      tideHeight: currentHeight,
      nextHighTide: nextHigh?.dateTime,
      nextLowTide: nextLow?.dateTime,
      tideState: _determineTideState(
        nextHigh: nextHigh,
        nextLow: nextLow,
      ),
    );
  }

  static double _currentHeight(
      List<TideHeightDto> heights,
      DateTime now,
      ) {
    if (heights.isEmpty) {
      return 0.0;
    }

    TideHeightDto current = heights.first;

    for (final height in heights) {
      if (!height.dateTime.isAfter(now)) {
        current = height;
      } else {
        break;
      }
    }

    return current.height;
  }

  static String _determineTideState({
    TideExtremeDto? nextHigh,
    TideExtremeDto? nextLow,
  }) {
    if (nextHigh == null && nextLow == null) {
      return 'Unknown';
    }

    if (nextHigh == null) {
      return 'Outgoing';
    }

    if (nextLow == null) {
      return 'Incoming';
    }

    return nextHigh.dateTime.isBefore(nextLow.dateTime)
        ? 'Incoming'
        : 'Outgoing';
  }
}