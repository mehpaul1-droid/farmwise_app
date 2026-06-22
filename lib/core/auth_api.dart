import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthApi {

  static const String baseUrl =
      "https://farmwiseonlinebackend-production.up.railway.app";

  static Future<Map<String, dynamic>> register(String phone, String password) async {
    final res = await http.post(
      Uri.parse(baseUrl + "/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "phone": phone,
        "password": password,
      }),
    );

    final data = jsonDecode(res.body);

    // فقط فارسی‌سازی بدون تغییر ساختار
    if (data["message"] != null) {
      if (data["message"].toString().contains("already") ||
          data["message"].toString().contains("exist")) {
        data["message"] = "این شماره قبلاً ثبت شده است";
      }
    }

    return data;
  }

  static Future<Map<String, dynamic>> login(String phone, String password) async {
    final res = await http.post(
      Uri.parse(baseUrl + "/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "phone": phone,
        "password": password,
      }),
    );

    final data = jsonDecode(res.body);

    if (data["status"] != "ok") {
      data["message"] = "شماره موبایل یا رمز عبور اشتباه است";
    }

    return data;
  }
}
