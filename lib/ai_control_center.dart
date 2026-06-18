import 'package:flutter/material.dart';
import 'ai_service.dart';

class AIControlCenter extends StatelessWidget {
  const AIControlCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("مرکز کنترل FarmWise AI"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const Text(
              "داشبورد هوشمند دامداری",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            _buildCard("🐄 تعداد دام‌ها", "128 رأس"),
            _buildCard("⚠️ هشدارهای فعال", "3 مورد"),
            _buildCard("📡 آخرین تحلیل AI", "سالم - بدون مشکل جدی"),

            const SizedBox(height: 30),

            ElevatedButton(
  onPressed: () async {
    final result = await AIService.analyzeFarmData();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(result),
        duration: const Duration(seconds: 3),
      ),
    );
  },
  child: const Text("اجرای تحلیل هوش مصنوعی واقعی"),
),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String value) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}