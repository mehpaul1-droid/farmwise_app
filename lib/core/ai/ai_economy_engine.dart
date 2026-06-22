class AIEconomyEngine {

  static Map<String, dynamic> analyze({
    required String animalType,
    required int count,
    required double feedCostPerDay,
    required double productRevenuePerDay,
  }) {

    // سود فعلی
    double currentProfit = productRevenuePerDay - feedCostPerDay;

    // تاثیر پروتئین SHI
    double shiSaving = feedCostPerDay * 0.18; // 18% کاهش هزینه خوراک
    double shiBoostRevenue = productRevenuePerDay * 0.12; // 12% افزایش راندمان

    double newFeedCost = feedCostPerDay - shiSaving;
    double newRevenue = productRevenuePerDay + shiBoostRevenue;

    double newProfit = newRevenue - newFeedCost;

    double roiImprovement = ((newProfit - currentProfit) / currentProfit) * 100;

    return {
      "animalType": animalType,

      "currentProfit": currentProfit,
      "futureProfitWithSHI": newProfit,

      "feedCostReduction": shiSaving,
      "revenueIncrease": shiBoostRevenue,

      "roiImprovementPercent": roiImprovement,

      "breakEvenTip":
          roiImprovement > 20
              ? "استفاده از پروتئین SHI کاملاً اقتصادی و توصیه می‌شود"
              : "بهینه‌سازی جزئی پیشنهاد می‌شود",

      "recommendation":
          "جایگزینی بخشی از سویا و پودر ماهی با پروتئین SHI باعث افزایش سوددهی می‌شود"
    };
  }
}
