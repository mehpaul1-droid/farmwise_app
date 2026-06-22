class SHICalculator {

  // درصد جایگزینی SHI در خوراک
  static double replaceProtein(double totalFeedCost, double shiPercent) {

    // فرض:
    // SHI باعث کاهش هزینه پروتئین میشه

    double reduction = totalFeedCost * (shiPercent / 100);

    return totalFeedCost - reduction;
  }

  // سود نهایی با SHI
  static double calculateProfit(double income, double costAfterSHI) {
    return income - costAfterSHI;
  }
}
