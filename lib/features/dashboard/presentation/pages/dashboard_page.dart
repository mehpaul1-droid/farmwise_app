import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String aiResult = "هنوز تحلیلی انجام نشده";

  Future<void> runAI() async {
    final url = Uri.parse("https://farmwise-ai-backend.onrender.com");

    final res = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "type": "cow",
        "count": 10,
        "useCityProtein": true
      }),
    );

    final data = jsonDecode(res.body);

    setState(() {
      aiResult = data["aiNote"] +
          "\n\nسود: ${data["totalProfit"]}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("FarmWise Dashboard"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // کارت وضعیت
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("🐄 تعداد دام: 128"),
                  SizedBox(height: 8),
                  Text("⚠️ هشدارهای فعال: 3"),
                  SizedBox(height: 8),
                  Text("🤖 وضعیت AI: پایدار"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // دکمه AI
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: runAI,
                child: const Text("اجرای تحلیل هوش مصنوعی"),
              ),
            ),

            const SizedBox(height: 20),

            // خروجی AI
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(aiResult),
            ),
          ],
        ),
      ),
    );
  }
}