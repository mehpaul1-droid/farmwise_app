import 'dart:convert';
import 'package:http/http.dart' as http;

class DashboardApi {

  static const base =
      "https://farmwiseonlinebackend-production.up.railway.app";

  static Future<Map<String, dynamic>> getDashboard() async {

    final res = await http.get(
      Uri.parse("$base/dashboard"),
    );

    return jsonDecode(res.body);
  }
}
