import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {

  static Future<bool> login(String phone, String pass) async {
    try {
      final res = await http.post(
        Uri.parse("https://farmwiseonlinebackend-production.up.railway.app/login"),
        body: jsonEncode({
          "phone": phone,
          "password": pass
        }),
        headers: {"Content-Type": "application/json"},
      );

      return res.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
