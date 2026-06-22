class LoginService {
  static String? _role;
  static bool _loggedIn = false;

  static bool get isLoggedIn => _loggedIn;
  static String get role => _role ?? "guest";

  static bool login(String user, String pass) {
    if (user == "admin" && pass == "1234") {
      _role = "admin";
      _loggedIn = true;
      return true;
    }

    if (user.isNotEmpty && pass.isNotEmpty) {
      _role = "worker";
      _loggedIn = true;
      return true;
    }

    return false;
  }

  static void logout() {
    _loggedIn = false;
    _role = null;
  }
}
