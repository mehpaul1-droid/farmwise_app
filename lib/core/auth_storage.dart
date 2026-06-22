import 'package:shared_preferences/shared_preferences.dart';

class AuthStorage {

  static Future saveLogin(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("user", phone);
  }

  static Future<String?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("user");
  }

  static Future logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
