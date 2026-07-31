import 'package:intl/intl.dart';

import 'fishing_window_evaluator.dart';

/// Formats Neptune fishing windows for display.
class FishingWindowFormatter {
  const FishingWindowFormatter();

  String format(
      FishingWindow? window,
      ) {
    if (window == null) {
      return 'No suitable fishing window';
    }

    final formatter = DateFormat('HH:mm');

    return '${formatter.format(window.start)}'
        ' - '
        '${formatter.format(window.end)}';
  }
}