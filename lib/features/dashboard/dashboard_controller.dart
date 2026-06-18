import '../../core/models/animal_profile.dart';
import '../../core/models/livestock_type.dart';

import '../../core/ai/farm_ai_engine.dart';
import '../../core/ai/ai_prediction_result.dart';

import '../../core/profit/farm_profit_engine.dart';
import '../../core/models/profit_result.dart';

import '../../core/services/ai_service.dart';

class DashboardController {

  late List<AnimalProfile> animals;

  DashboardController() {
    animals = [
      AnimalProfile(
        type: LivestockType.cow,
        count: 40,
        avgWeight: 420,
        ageDays: 900,
      ),
    ];
  }

  // 📊 تعداد کل دام‌ها
  int totalAnimals() {
    return animals.fold(0, (sum, a) => sum + a.count);
  }

  // 🤖 AI محلی (offline)
  AIPredictionResult getAIPrediction() {
    return FarmAIEngine.predict(animals.first);
  }

  // 💰 سوددهی فارم
  ProfitResult getProfitAnalysis() {
    return FarmProfitEngine.calculate(
      profile: animals.first,
      feedCostPerKg: 12,
      marketPricePerKg: 80,
    );
  }

  // 🌐 AI آنلاین واقعی (OpenAI)
  Future<String> getAIAdvice(String question) async {
    return await AIService.askAI(question);
  }
}