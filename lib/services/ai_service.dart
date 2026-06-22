class AIService {
  static String analyzeFarm(String type, int count) {
    return "تحلیل AI موقت: نوع دام $type - تعداد $count - وضعیت: پایدار - پیشنهاد: افزایش 8% بهره‌وری";
  }

  static double feedEfficiency(int count) {
    return count * 1.4;
  }

  static double profit(double income, double cost) {
    return income - cost;
  }
}