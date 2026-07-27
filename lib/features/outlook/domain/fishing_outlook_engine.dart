import '../../marine/domain/models/marine_conditions.dart';
import 'fishing_outlook.dart';

class FishingOutlookEngine {
  const FishingOutlookEngine();

  FishingOutlook generate(
      MarineConditions conditions,
      ) {
    final highlights = <String>[];

    int confidence = 50;

    //--------------------------------
    // Wind
    //--------------------------------

    if (conditions.windSpeed <= 10) {
      confidence += 15;
      highlights.add('Light wind supports comfortable fishing.');
    } else if (conditions.windSpeed <= 20) {
      confidence += 8;
      highlights.add('Moderate wind remains fishable.');
    } else {
      highlights.add('Strong winds may reduce comfort and casting distance.');
    }

    //--------------------------------
    // Swell
    //--------------------------------

    if (conditions.swellHeight >= 1 &&
        conditions.swellHeight <= 2) {
      confidence += 15;
      highlights.add('Moderate swell should provide productive water movement.');
    } else if (conditions.swellHeight > 3) {
      confidence -= 10;
      highlights.add('Large swell may reduce accessible fishing areas.');
    }

    //--------------------------------
    // Tide
    //--------------------------------

    switch (conditions.tideState.toLowerCase()) {
      case 'incoming':
      case 'rising':
        confidence += 15;
        highlights.add('Incoming tide is building.');
        break;

      case 'high':
        confidence += 10;
        highlights.add('High tide is approaching.');
        break;

      case 'outgoing':
      case 'falling':
        highlights.add('Outgoing tide may suit selected species.');
        break;

      default:
        highlights.add('Tide trend unavailable.');
    }

    if (confidence > 100) {
      confidence = 100;
    }

    String bestWindow = 'Monitor conditions';

    if (conditions.nextHighTide != null) {
      final high = conditions.nextHighTide!.toLocal();

      bestWindow =
      '${high.hour.toString().padLeft(2, '0')}:'
          '${high.minute.toString().padLeft(2, '0')} High Tide';
    }

    return FishingOutlook(
      title: 'Today\'s Fishing Outlook',
      summary:
      'Marine conditions remain favourable based on the current wind, swell and tide.',
      bestWindow: bestWindow,
      confidence: confidence,
      highlights: highlights,
    );
  }
}