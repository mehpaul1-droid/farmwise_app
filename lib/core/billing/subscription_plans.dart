class SubscriptionPlans {

  static const String basic = "basic";
  static const String pro = "pro";
  static const String enterprise = "enterprise";

  static Map<String, Map<String, dynamic>> plans = {
    "basic": {
      "price": 0,
      "farms": 1,
      "aiLevel": "simple"
    },

    "pro": {
      "price": 15,
      "farms": 10,
      "aiLevel": "advanced"
    },

    "enterprise": {
      "price": 49,
      "farms": -1,
      "aiLevel": "full"
    }
  };

  static Map<String, dynamic> getPlan(String plan) {
    return plans[plan] ?? plans["basic"]!;
  }
}
