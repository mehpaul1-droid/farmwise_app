import '../models/animal_profile.dart';
import '../models/livestock_type.dart';
import 'ai_prediction_result.dart';

class FarmAIEngine {

  static AIPredictionResult predict(AnimalProfile profile) {

    double weightGain = 0;
    double eggProduction = 0;
    double riskScore = 0;
    String healthStatus = "پایدار";
    List<String> insights = [];

    switch (profile.type) {

      case LivestockType.cow:
        weightGain = profile.avgWeight * 0.12;
        riskScore = 0.2;
        insights.add("رشد گاو طبیعی است");
        break;

      case LivestockType.sheep:
        weightGain = profile.avgWeight * 0.15;
        riskScore = 0.25;
        insights.add("رشد گوسفند مناسب است");
        break;

      case LivestockType.goat:
        weightGain = profile.avgWeight * 0.14;
        riskScore = 0.2;
        break;

      case LivestockType.layerChicken:
        eggProduction = profile.count * 0.85;
        riskScore = 0.15;
        insights.add("تولید تخم‌مرغ مطلوب است");
        break;

      case LivestockType.broilerChicken:
        weightGain = profile.avgWeight * 0.25;
        riskScore = 0.18;
        break;

      case LivestockType.turkey:
        weightGain = profile.avgWeight * 0.2;
        riskScore = 0.22;
        break;

      case LivestockType.quail:
        eggProduction = profile.count * 0.9;
        riskScore = 0.1;
        break;
    }

    if (riskScore < 0.2) {
      healthStatus = "سالم";
    } else if (riskScore < 0.4) {
      healthStatus = "نیاز به مراقبت";
    } else {
      healthStatus = "پرریسک";
    }

    return AIPredictionResult(
      predictedWeightGain: weightGain,
      predictedEggProduction: eggProduction,
      healthStatus: healthStatus,
      riskScore: riskScore,
      insights: insights,
    );
  }
}