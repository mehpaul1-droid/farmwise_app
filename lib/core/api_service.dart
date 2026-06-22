import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  static const base =
      "https://farmwiseonlinebackend-production.up.railway.app";

  static Future<Map<String, dynamic>> register(String phone, String pass) async {
    final res = await http.post(
      Uri.parse("$base/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"phone": phone, "password": pass}),
    );

    return jsonDecode(res.body);
  }

  static Future<Map<String, dynamic>> login(String phone, String pass) async {
    final res = await http.post(
      Uri.parse("$base/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"phone": phone, "password": pass}),
    );

    return jsonDecode(res.body);
  }
}
