import 'package:flutter/material.dart';
import '../screens/dashboard.dart';
import '../screens/login_page.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    if (!isLoggedIn) {
      return LoginPage(
        onLoginSuccess: () {
          setState(() {
            isLoggedIn = true;
          });
        },
      );
    }

    return const Dashboard();
  }
}
