import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(title: const Text("ثبت نام")),
      body: const Center(
        child: Text(
          "صفحه ثبت نام (در حال توسعه)",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
