class MarketIntelligence {

  static Map<String, dynamic> analyzeMarket() {

    // قیمت‌های فرضی بازار ایران (قابل اتصال به API واقعی بعداً)
    double soybeanPrice = 22000; // تومان
    double fishMealPrice = 45000;
    double shiProteinPrice = 15000;

    // تحلیل رقابتی
    double savingVsSoy = ((soybeanPrice - shiProteinPrice) / soybeanPrice) * 100;
    double savingVsFish = ((fishMealPrice - shiProteinPrice) / fishMealPrice) * 100;

    return {
      "soybeanPrice": soybeanPrice,
      "fishMealPrice": fishMealPrice,
      "shiProteinPrice": shiProteinPrice,

      "savingVsSoybeanPercent": savingVsSoy,
      "savingVsFishMealPercent": savingVsFish,

      "marketAdvice":
          savingVsSoy > 25
              ? "پروتئین SHI جایگزین بسیار اقتصادی برای سویا است"
              : "مزیت اقتصادی متوسط",

      "investmentSignal":
          savingVsFish > 50
              ? "فرصت سرمایه‌گذاری قوی در تولید SHI"
              : "بازار پایدار"
    };
  }
}
