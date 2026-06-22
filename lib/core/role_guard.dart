import 'core/auth_service.dart';

class RoleGuard {
  static bool isAdmin() {
    return AuthService.role == "admin";
  }

  static bool isUser() {
    return AuthService.role == "user";
  }

  static bool isOperator() {
    return AuthService.role == "operator";
  }
}
