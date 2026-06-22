import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        fit: StackFit.expand,
        children: [

          // 🌿 Background image (placeholder)
          Image.network(
            "https://images.unsplash.com/photo-1501004318641-b39e6451bec6",
            fit: BoxFit.cover,
          ),

          // 🌑 overlay blur dark
          Container(
            color: Colors.black.withOpacity(0.6),
          ),

          // 📊 content
          ListView(
            padding: const EdgeInsets.all(16),
            children: [

              const SizedBox(height: 40),

              const Text(
                "FarmWise Dashboard",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              _card("درآمد کل", "1200000"),
              _card("هزینه کل", "800000"),
              _card("سود خالص", "400000"),

              const SizedBox(height: 20),

              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "📈 نمودار SHI",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _card(String title, String value) {
    return Card(
      color: Colors.white.withOpacity(0.1),
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: Text(
          value,
          style: const TextStyle(
            color: Colors.greenAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
