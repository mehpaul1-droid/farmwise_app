import 'package:flutter/material.dart';
import 'services/api_service.dart';

class TestAiPage extends StatefulWidget {
  const TestAiPage({super.key});

  @override
  State<TestAiPage> createState() => _TestAiPageState();
}

class _TestAiPageState extends State<TestAiPage> {
  String result = "هنوز تست انجام نشده";
  bool loading = false;

  void runTest() async {
    setState(() => loading = true);

    try {
      final res = await ApiService.analyzeFarm(
        type: "cow",
        count: 10,
      );

      setState(() {
        result = res.toString();
      });
    } catch (e) {
      setState(() {
        result = "خطا: $e";
      });
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI Test")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: loading ? null : runTest,
              child: Text(loading ? "در حال تحلیل..." : "اجرای تحلیل AI"),
            ),
            const SizedBox(height: 20),
            Expanded(child: SingleChildScrollView(child: Text(result))),
          ],
        ),
      ),
    );
  }
}