class FeedRecommendationAI {

  static Map<String, dynamic> optimize({
    required String animalType,
    required int count,
  }) {

    // پایه خوراک سنتی
    double soybean = 40;
    double fishMeal = 10;

    // جایگزینی با پروتئین SHI
    double shiProtein = 0;

    if (animalType == "مرغ" || animalType == "مرغ تخمگذار") {
      shiProtein = 15;
      soybean -= 10;
      fishMeal -= 5;
    }

    if (animalType == "گاو" || animalType == "گوسفند") {
      shiProtein = 10;
      soybean -= 5;
      fishMeal -= 3;
    }

    double costReduction = shiProtein * 0.6;

    return {
      "animalType": animalType,

      "soybeanPercent": soybean,
      "fishMealPercent": fishMeal,

      "shiProteinPercent": shiProtein,

      "oilSource": "روغن SHI",

      "feedEfficiencyBoost": shiProtein * 0.8,
      "costReductionPercent": costReduction,

      "recommendation":
          "جایگزینی بخشی از سویا و پودر ماهی با پروتئین SHI باعث کاهش هزینه و افزایش راندمان می‌شود"
    };
  }
}
