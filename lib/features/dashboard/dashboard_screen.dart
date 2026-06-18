import 'package:flutter/material.dart';
import 'dashboard_controller.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final controller = DashboardController();
  bool loading = false;

  String aiResult = "";

  @override
  Widget build(BuildContext context) {

    final total = controller.totalAnimals();
    final ai = controller.getAIPrediction();
    final profit = controller.getProfitAnalysis();

    return Scaffold(
      appBar: AppBar(
        title: const Text("🐄 Smart Farm AI"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // 📊 دام‌ها
            Text(
              "🐄 کل دام و طیور: $total",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // 🤖 AI داخلی
            const Text(
              "🤖 تحلیل هوش مصنوعی (محلی)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Text("📈 رشد: ${ai.predictedWeightGain.toStringAsFixed(2)}"),
            Text("🥚 تخم‌مرغ: ${ai.predictedEggProduction.toStringAsFixed(0)}"),
            Text("🩺 وضعیت: ${ai.healthStatus}"),
            Text("⚠️ ریسک: ${(ai.riskScore * 100).toStringAsFixed(0)}%"),

            const SizedBox(height: 15),

            // 💰 سوددهی
            const Text(
              "💰 تحلیل سوددهی",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Text("💵 درآمد: ${profit.revenue.toStringAsFixed(0)}"),
            Text("🌾 خوراک: ${profit.feedCost.toStringAsFixed(0)}"),
            Text("📊 سود: ${profit.profit.toStringAsFixed(0)}"),

            const SizedBox(height: 25),

            // 🌐 AI آنلاین
            const Text(
              "🌐 AI آنلاین (OpenAI)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: loading
                  ? null
                  : () async {

                      setState(() {
                        loading = true;
                        aiResult = "";
                      });

                      final result = await controller.getAIAdvice(
                        "برای مزرعه گاو، گوسفند و مرغ، بهترین جیره اقتصادی و کم‌هزینه چیست؟"
                      );

                      setState(() {
                        aiResult = result;
                        loading = false;
                      });
                    },
              child: Text(loading ? "در حال پردازش..." : "اجرای AI واقعی"),
            ),

            const SizedBox(height: 15),

            if (aiResult.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(aiResult),
              ),
          ],
        ),
      ),
    );
  }
}