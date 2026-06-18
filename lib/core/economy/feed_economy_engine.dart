import '../models/animal_profile.dart';

class FeedEconomyEngine {

  static FeedCostResult calculate({
    required AnimalProfile profile,
    required double feedPricePerKg,
  }) {

    // مصرف خوراک ساده (تقریبی)
    double dailyFeedKg = profile.avgWeight * 0.03;
    double monthlyFeedKg = dailyFeedKg * 30;

    double traditionalCost = monthlyFeedKg * feedPricePerKg;

    // پروتئین اختصاصی شهر (ارزان‌تر ولی بهینه‌تر)
    double cityProteinCost = monthlyFeedKg * (feedPricePerKg * 0.85);

    double totalCost = cityProteinCost;

    bool recommendCityProtein = cityProteinCost < traditionalCost;

    List<String> insights = [];

    if (recommendCityProtein) {
      insights.add("استفاده از پروتئین اختصاصی شهر باعث کاهش هزینه می‌شود");
      insights.add("افزایش راندمان رشد در طیور مشاهده می‌شود");
    } else {
      insights.add("در این شرایط خوراک سنتی به‌صرفه‌تر است");
    }

    return FeedCostResult(
      totalCost: totalCost,
      traditionalCost: traditionalCost,
      cityProteinCost: cityProteinCost,
      recommendCityProtein: recommendCityProtein,
      insights: insights,
    );
  }
}