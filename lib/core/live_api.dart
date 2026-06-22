import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class LiveApi {

  static const baseUrl =
      "https://farmwiseonlinebackend-production.up.railway.app";

  static Future<Map<String, dynamic>> fetchLive() async {
    final res = await http.get(Uri.parse("\$baseUrl/analytics/live"));
    return jsonDecode(res.body);
  }
}
