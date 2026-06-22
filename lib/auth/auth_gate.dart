import 'package:flutter/material.dart';
import 'login_page.dart';
import '../screens/farm_list_screen.dart';
import 'login_service.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {

  @override
  Widget build(BuildContext context) {

    if (!LoginService.isLoggedIn) {
      return LoginPage(
        onSuccess: () {
          setState(() {});
        },
      );
    }

    return const FarmListScreen();
  }
}
