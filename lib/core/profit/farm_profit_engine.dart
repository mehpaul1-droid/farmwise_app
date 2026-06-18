import '../models/animal_profile.dart';
import '../models/livestock_type.dart';
import '../models/profit_result.dart';

class FarmProfitEngine {

  static ProfitResult calculate({
    required AnimalProfile profile,
    required double feedCostPerKg,
    required double marketPricePerKg, // قیمت فروش
  }) {

    double dailyFeed = profile.avgWeight * 0.03;
    double monthlyFeed = dailyFeed * 30;

    double feedCost = monthlyFeed * feedCostPerKg;

    double revenue = 0;

    // درآمد بسته به نوع حیوان
    switch (profile.type) {

      case LivestockType.cow:
        revenue = profile.avgWeight * 0.8;
        break;

      case LivestockType.sheep:
        revenue = profile.avgWeight * 0.9;
        break;

      case LivestockType.goat:
        revenue = profile.avgWeight * 0.85;
        break;

      case LivestockType.layerChicken:
        revenue = profile.count * 30 * 0.5; // تخم‌مرغ
        break;

      case LivestockType.broilerChicken:
        revenue = profile.avgWeight * 1.2;
        break;

      case LivestockType.turkey:
        revenue = profile.avgWeight * 1.1;
        break;

      case LivestockType.quail:
        revenue = profile.count * 30 * 0.3;
        break;
    }

    double otherCosts = revenue * 0.15;
    double profit = revenue - feedCost - otherCosts;

    String status;
    List<String> insights = [];

    if (profit > 0) {
      status = "سودده";
      insights.add("فارم در وضعیت سوددهی قرار دارد");
    } else {
      status = "زیان‌ده";
      insights.add("هزینه‌ها از درآمد بیشتر است");
    }

    if (feedCost > revenue * 0.5) {
      insights.add("هزینه خوراک بالا است → نیاز به بهینه‌سازی جیره");
    }

    return ProfitResult(
      revenue: revenue,
      feedCost: feedCost,
      otherCosts: otherCosts,
      profit: profit,
      status: status,
      insights: insights,
    );
  }
}