class SaaSCore {

  static Map<String, dynamic> plans = {
    "starter": {
      "price": 99000,
      "ai_level": "basic",
      "farms": 1
    },

    "growth": {
      "price": 299000,
      "ai_level": "pro",
      "farms": 10
    },

    "enterprise": {
      "price": 990000,
      "ai_level": "full",
      "farms": -1
    }
  };

  static double calculateRevenue(int users) {
    return users * 299000;
  }

  static String getRecommendation(int profitIncrease) {
    if (profitIncrease > 15) {
      return "Upgrade to PRO plan recommended";
    }
    return "Starter plan sufficient";
  }
}
