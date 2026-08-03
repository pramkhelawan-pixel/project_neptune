// -----------------------------------------------------------------------------
// Neptune Fishing Intelligence Platform
// -----------------------------------------------------------------------------
// File: tide_conditions_mapper.dart
//
// Purpose:
// Maps WorldTides observations into Neptune's canonical TideConditions value
// object.
//
// -----------------------------------------------------------------------------

import '../../domain/enums/tide_state.dart';
import '../../domain/value_objects/tide_conditions.dart';

import '../models/tide_dto.dart';

class TideConditionsMapper {
  const TideConditionsMapper._();

  static TideConditions toDomain(
      TideDto dto,
      ) {
    final now = DateTime.now().toUtc();

    final currentHeight = _currentHeight(
      dto.heights,
      now,
    );

    TideExtremeDto? nextHigh;
    TideExtremeDto? nextLow;

    for (final extreme in dto.extremes) {
      if (!extreme.dateTime.isAfter(now)) {
        continue;
      }

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

    return TideConditions(
      state: _determineState(
        nextHigh,
        nextLow,
      ),
      height: currentHeight,
      nextHigh: nextHigh?.dateTime ?? now,
      nextLow: nextLow?.dateTime ?? now,
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

  static TideState _determineState(
      TideExtremeDto? nextHigh,
      TideExtremeDto? nextLow,
      ) {
    if (nextHigh == null && nextLow == null) {
      return TideState.low;
    }

    if (nextHigh == null) {
      return TideState.outgoing;
    }

    if (nextLow == null) {
      return TideState.incoming;
    }

    return nextHigh.dateTime.isBefore(nextLow.dateTime)
        ? TideState.incoming
        : TideState.outgoing;
  }
}