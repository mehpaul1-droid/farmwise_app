import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AIScreen extends StatefulWidget {
  const AIScreen({super.key});

  @override
  State<AIScreen> createState() => _AIScreenState();
}

class _AIScreenState extends State<AIScreen> {
  String result = "هنوز تحلیلی انجام نشده";
  bool loading = false;

  Future<void> runAI() async {
    setState(() => loading = true);

    final res = await ApiService.analyzeFarm(
      type: "cow",
      count: 50,
    );

    setState(() {
      result = res["aiNote"].toString();
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text("تحلیل هوشمند فارم"),
        backgroundColor: const Color(0xFF0F172A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              result,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: loading ? null : runAI,
              child: loading
                  ? const CircularProgressIndicator()
                  : const Text("اجرای تحلیل AI"),
            )
          ],
        ),
      ),
    );
  }
}
