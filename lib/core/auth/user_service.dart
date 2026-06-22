import '../../models/app_user.dart';

class UserService {
  static AppUser currentUser = AppUser(
    id: "1",
    name: "Admin",
    role: "admin",
  );

  static bool isAdmin() => currentUser.role == "admin";
  static bool isManager() => currentUser.role == "manager";
  static bool isWorker() => currentUser.role == "worker";
}
