import 'package:flutter/material.dart';
import '../core/api_service.dart';

class ShiDashboardWidget extends StatelessWidget {
  const ShiDashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: ApiService.getShiProfit(1),
      builder: (context, snapshot) {

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.data as Map<String, dynamic>;

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "SHI تحلیل فارم",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 10),

              Text("درآمد: ${data['income']}",
                  style: const TextStyle(color: Colors.white70)),

              Text("هزینه: ${data['cost']}",
                  style: const TextStyle(color: Colors.white70)),

              Text("صرفه‌جویی SHI: ${data['shi_saving']}",
                  style: const TextStyle(color: Colors.greenAccent)),

              Text("سود نهایی: ${data['final_profit']}",
                  style: const TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        );
      },
    );
  }
}
