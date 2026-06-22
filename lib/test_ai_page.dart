import 'package:flutter/material.dart';
import 'services/api_service.dart';

class TestAIPage extends StatefulWidget {
  const TestAIPage({super.key});

  @override
  State<TestAIPage> createState() => _TestAIPageState();
}

class _TestAIPageState extends State<TestAIPage> {
  String resultText = "هنوز تحلیلی انجام نشده است.";
  bool loading = false;

  Future<void> runTest() async {
    setState(() => loading = true);

    final result = await ApiService.analyzeFarm(
      type: "cow",
      count: 25,
    );

    setState(() {
      resultText = result["aiNote"].toString();
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text("تست هوش مصنوعی"),
        backgroundColor: const Color(0xFF0F172A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              resultText,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: loading ? null : runTest,
              child: loading
                  ? const CircularProgressIndicator()
                  : const Text("اجرای تست AI"),
            ),
          ],
        ),
      ),
    );
  }
}
