import 'package:flutter/material.dart';
import '../core/auth_api.dart';
import '../app_shell.dart';
import 'register_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final phone = TextEditingController();
  final password = TextEditingController();

  bool loading = false;

  void login() async {

    setState(() => loading = true);

    final res = await AuthApi.login(phone.text, password.text);

    setState(() => loading = false);

    if (res["status"] == "ok") {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const AppShell(),
        ),
      );

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res["message"] ?? "خطا در ورود")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text(
                "سامانه مدیریت فارم",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: phone,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: "شماره موبایل",
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: password,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: "رمز عبور",
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: loading ? null : login,
                  child: Text(loading ? "در حال ورود..." : "ورود"),
                ),
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RegisterPage(),
                    ),
                  );
                },
                child: const Text("ثبت نام"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
