import 'dart:convert';
import 'package:http/http.dart' as http;

class AnalyticsApi {
  static const String baseUrl = "https://farmwise-online-backend.onrender.com";

  static Future<Map<String, dynamic>> getProfitData() async {
    final res = await http.get(
      Uri.parse("$baseUrl/analytics/profit"),
    );

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      throw Exception("Analytics API Error");
    }
  }
}
