class TenantService {

  static String? _userId;

  static void setUser(String id) {
    _userId = id;
  }

  static String get userId {
    return _userId ?? "guest";
  }

  static bool isLoggedIn() {
    return _userId != null;
  }

  static void logout() {
    _userId = null;
  }
}
