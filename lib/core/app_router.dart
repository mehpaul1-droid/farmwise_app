import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';

class AppRouter {
  static bool isLoggedIn = false;

  static Widget getStartScreen() {
    if (isLoggedIn) {
      return const HomeScreen();
    } else {
      return const LoginScreen();
    }
  }
}
