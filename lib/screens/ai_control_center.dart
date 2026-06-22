import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AIControlCenter extends StatelessWidget {
  const AIControlCenter({super.key});

  Future<void> runAI(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);

    final result = await ApiService.analyzeFarm(
      type: "cow",
      count: 128,
    );

    messenger.showSnackBar(
      SnackBar(
        content: Text(result["aiNote"].toString()),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text("مرکز کنترل FarmWise AI"),
        centerTitle: true,
        backgroundColor: const Color(0xFF0F172A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "داشبورد هوشمند دامداری",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _buildCard("🐄 تعداد دام‌ها", "128 رأس"),
            _buildCard("⚠️ هشدارهای فعال", "3 مورد"),
            _buildCard("📡 آخرین تحلیل AI", "سالم - بدون مشکل جدی"),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => runAI(context),
              child: const Text("اجرای تحلیل هوش مصنوعی"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String value) {
    return Card(
      color: const Color(0xFF111C33),
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.greenAccent,
          ),
        ),
      ),
    );
  }
}
