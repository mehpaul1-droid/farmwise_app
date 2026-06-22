class SaaSRevenueModel {

  static Map<String, dynamic> plans = {
    "free": {
      "price": 0,
      "farmLimit": 1,
      "features": ["analysis_basic"]
    },

    "pro": {
      "price": 199000,
      "farmLimit": 10,
      "features": [
        "ai_feed",
        "economy_analysis",
        "market_intelligence"
      ]
    },

    "enterprise": {
      "price": 990000,
      "farmLimit": -1,
      "features": [
        "full_ai",
        "api_access",
        "custom_model",
        "priority_support"
      ]
    }
  };

  static Map<String, dynamic> getPlan(String type) {
    return plans[type] ?? plans["free"]!;
  }

  static double calculatePotentialRevenue(int users) {
    return users * 199000; // Pro plan avg
  }
}
