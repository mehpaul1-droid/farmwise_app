import 'package:flutter/material.dart';
import '../services/farm_service.dart';
import '../services/active_farm.dart';
import '../models/farm.dart';
import 'dashboard.dart';

class FarmListScreen extends StatefulWidget {
  const FarmListScreen({super.key});

  @override
  State<FarmListScreen> createState() => _FarmListScreenState();
}

class _FarmListScreenState extends State<FarmListScreen> {

  List<Farm> livestock = [];
  List<Farm> poultry = [];

  @override
  void initState() {
    super.initState();
    livestock = FarmService.getLivestock();
    poultry = FarmService.getPoultry();
  }

  void openFarm(Farm farm) {
    ActiveFarm.setFarm(farm);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const DashboardScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text("سامانه مدیریت فارم"),
        backgroundColor: const Color(0xFF0F172A),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          const Text(
            "🐄 مدیریت دام",
            style: TextStyle(color: Colors.greenAccent, fontSize: 20),
          ),

          ...livestock.map((f) => Card(
            color: const Color(0xFF111C33),
            child: ListTile(
              title: Text(f.name, style: const TextStyle(color: Colors.white)),
              subtitle: Text(f.type, style: const TextStyle(color: Colors.white70)),
              onTap: () => openFarm(f),
            ),
          )),

          const SizedBox(height: 20),

          const Text(
            "🐓 مدیریت طیور",
            style: TextStyle(color: Colors.greenAccent, fontSize: 20),
          ),

          ...poultry.map((f) => Card(
            color: const Color(0xFF111C33),
            child: ListTile(
              title: Text(f.name, style: const TextStyle(color: Colors.white)),
              subtitle: Text(f.type, style: const TextStyle(color: Colors.white70)),
              onTap: () => openFarm(f),
            ),
          )),
        ],
      ),
    );
  }
}
