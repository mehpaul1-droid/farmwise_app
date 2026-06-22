import '../../models/farm.dart';
import '../ai/feed_recommendation_ai.dart';
import '../ai/ai_economy_engine.dart';
import '../ai/market_intelligence.dart';

class AIEngine {

  static Map<String, dynamic> analyzeFarm(Farm farm) {

    final feed = FeedRecommendationAI.optimize(
      animalType: farm.type,
      count: farm.animalCount,
    );

    final economy = AIEconomyEngine.analyze(
      animalType: farm.type,
      count: farm.animalCount,
      feedCostPerDay: farm.animalCount * 500,
      productRevenuePerDay: farm.animalCount * 700,
    );

    final market = MarketIntelligence.analyzeMarket();

    return {
      "animalType": farm.type,

      // 🧠 سلامت
      "healthStatus": "سالم",
      "riskScore": farm.animalCount * 0.01,

      // 🥗 تغذیه
      "feedRecommendation": feed,

      // 💰 اقتصاد
      "economy": economy,

      // 📊 بازار
      "market": market,

      // 📈 پیش‌بینی
      "futureProfitEstimate": economy["futureProfitWithSHI"],
      "aiConfidence": "بالا",

      "warning": "سیستم آماده بهره‌برداری اقتصادی"
    };
  }
}
