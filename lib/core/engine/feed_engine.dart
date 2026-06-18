import '../models/animal_profile.dart';
import '../models/livestock_type.dart';
import '../models/feed_result.dart';

class FeedEngine {
  static FeedResult calculate(AnimalProfile p) {

    double protein = 0;
    double energy = 0;
    double fiber = 0;
    List<String> warnings = [];

    switch (p.type) {

      case LivestockType.cow:
        protein = 16;
        energy = 2.5;
        fiber = 18;

        if (p.avgWeight < 300) {
          warnings.add("وزن گاو پایین است");
        }
        break;

      case LivestockType.layerChicken:
        protein = 18;
        energy = 2.8;
        fiber = 5;

        if (p.ageDays < 120) {
          warnings.add("مرغ هنوز آماده تخمگذاری نیست");
        }
        break;

      case LivestockType.broilerChicken:
        protein = 20;
        energy = 3.0;
        fiber = 4;
        break;

      default:
        protein = 15;
        energy = 2.6;
        fiber = 10;
    }

    return FeedResult(
      protein: protein,
      energy: energy,
      fiber: fiber,
      warnings: warnings,
    );
  }
}