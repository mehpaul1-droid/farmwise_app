import 'package:flutter/material.dart';
import '../core/api_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final phone = TextEditingController();
  final pass = TextEditingController();

  bool loading = false;

  void login() async {

    setState(() => loading = true);

    final res = await ApiService.login(
      phone.text,
      pass.text,
    );

    setState(() => loading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(res["message"])),
    );

    if (res["status"] == "success") {
      Navigator.pushReplacementNamed(context, "/home");
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
                    "ورود به FarmWise",
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
                    onPressed: loading ? null : login,
                    child: Text(loading ? "..." : "ورود"),
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
