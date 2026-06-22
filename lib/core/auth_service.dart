import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  // ---------------- SAVE LOGIN ----------------
  static Future<void> saveLogin(String phone, String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("phone", phone);
    await prefs.setString("role", role);
    await prefs.setBool("loggedIn", true);
  }

  // ---------------- CHECK LOGIN ----------------
  static Future<bool> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("loggedIn") ?? false;
  }

  // ---------------- GET ROLE ----------------
  static Future<String?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("role");
  }

  // ---------------- LOGOUT ----------------
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
