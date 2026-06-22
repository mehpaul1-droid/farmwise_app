import 'package:flutter/material.dart';
import '../core/api_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final phone = TextEditingController();
  final pass = TextEditingController();

  bool loading = false;

  void register() async {

    setState(() => loading = true);

    final res = await ApiService.register(
      phone.text,
      pass.text,
    );

    setState(() => loading = false);

    final msg = res["message"];

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );

    if (res["status"] == "success") {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://images.unsplash.com/photo-1500595046743-cd271d694d30"
            ),
            fit: BoxFit.cover,
          ),
        ),

        child: Container(
          color: Colors.black.withOpacity(0.6),

          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text(
                    "ثبت‌نام کاربر",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller: phone,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: "شماره موبایل",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),

                  TextField(
                    controller: pass,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: "رمز عبور",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: loading ? null : register,
                    child: Text(loading ? "..." : "ثبت نام"),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
