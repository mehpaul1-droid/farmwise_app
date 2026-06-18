import 'dart:convert';
import 'package:http/http.dart' as http;

class AiService {
  static const String baseUrl = "http://10.0.2.2:3000"; 
  // اگر روی گوشی واقعی تست می‌کنی باید IP کامپیوترت رو بذاری

  static Future<Map<String, dynamic>> analyzeFarm({
    required String type,
    required int count,
    bool useCityProtein = true,
  }) async {
    final url = Uri.parse("$baseUrl/api/analyze");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "type": type,
        "count": count,
        "useCityProtein": useCityProtein,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Server error: ${response.body}");
    }
  }
}