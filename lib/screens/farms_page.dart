import 'package:flutter/material.dart';
import '../models/farm.dart';

class FarmsPage extends StatefulWidget {
  const FarmsPage({super.key});

  @override
  State<FarmsPage> createState() => _FarmsPageState();
}

class _FarmsPageState extends State<FarmsPage> {

  final List<Farm> farms = [
    Farm(name: "Farm 1", income: 1200000, cost: 800000),
    Farm(name: "Farm 2", income: 900000, cost: 500000),
    Farm(name: "Farm 3", income: 1500000, cost: 1100000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),

      appBar: AppBar(
        title: const Text("مدیریت فارم‌ها"),
      ),

      body: ListView.builder(
        itemCount: farms.length,
        itemBuilder: (context, index) {

          final farm = farms[index];

          return Card(
            color: Colors.white.withOpacity(0.08),
            child: ListTile(
              title: Text(farm.name,
                  style: const TextStyle(color: Colors.white)),
              subtitle: Text(
                "سود: ${farm.profit}",
                style: const TextStyle(color: Colors.white70),
              ),
              trailing: const Icon(Icons.agriculture, color: Colors.green),
            ),
          );
        },
      ),
    );
  }
}
