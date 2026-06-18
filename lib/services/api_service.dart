import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://farmwise-ai-backend.onrender.com";

  static Future<Map<String, dynamic>> analyzeFarm({
    required String type,
    required int count,
  }) async {
    final url = Uri.parse("\/api/analyze");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "type": type,
        "count": count,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Server Error: \");
    }
  }
}
