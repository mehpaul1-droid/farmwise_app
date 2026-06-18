import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  // فعلاً یک API تستی (بعداً واقعی می‌کنیم)
  static const String baseUrl = "https://jsonplaceholder.typicode.com/posts/1";

  static Future<String> analyzeFarmData() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // شبیه‌سازی پاسخ AI
        return "تحلیل انجام شد: وضعیت دام پایدار است. (ID: ${data['id']})";
      } else {
        return "خطا در ارتباط با AI";
      }
    } catch (e) {
      return "خطا: $e";
    }
  }
}