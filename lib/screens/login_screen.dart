import 'package:flutter/material.dart';
import '../core/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phone = TextEditingController();
  final pass = TextEditingController();
  bool loading = false;

  void doLogin() async {
    setState(() => loading = true);

    final ok = await AuthService.login(phone.text, pass.text);

    setState(() => loading = false);

    if (ok) {
      Navigator.pushReplacementNamed(context, "/dashboard");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Failed")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text(
                "سامانه هوشمند فارم",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: phone,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "شماره موبایل",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),

              TextField(
                controller: pass,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "رمز عبور",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: loading ? null : doLogin,
                child: Text(loading ? "Loading..." : "ورود"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
