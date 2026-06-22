import 'package:flutter/material.dart';
import '../services/active_farm.dart';
import '../core/ai/ai_engine.dart';
import '../core/auth/user_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Map<String, dynamic>? ai;
  bool loading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() {
    try {
      final farm = ActiveFarm.getFarm();

      if (farm == null) {
        setState(() {
          loading = false;
          error = "هیچ فارم فعالی انتخاب نشده";
        });
        return;
      }

      ai = AIEngine.analyzeFarm(farm);

      setState(() {
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
        error = "خطا در تحلیل AI";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = UserService.currentUser;

    if (loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (error != null) {
      return Scaffold(
        body: Center(
          child: Text(
            error!,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    }

    final data = ai ?? {};

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),

      appBar: AppBar(
        title: Text("پنل مدیریت فارم - ${user.role}"),
        backgroundColor: const Color(0xFF1B5E20),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text("سیستم هوشمند FarmWise"),
            ),
            ListTile(
              title: const Text("داشبورد"),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          _card("نوع حیوان", data["animalType"] ?? "-"),
          _card("سلامت", data["healthStatus"] ?? "-"),
          _card("ریسک", data["riskScore"]?.toString() ?? "-"),
          _card("پیشنهاد AI", data["recommendation"] ?? "-"),

          const SizedBox(height: 20),

          _card("📈 رشد 7 روزه", data["7dayGrowthForecast"] ?? "-"),
          _card("⚠️ ریسک آینده", data["7dayRiskForecast"] ?? "-"),
          _card("💰 سود تخمینی", data["futureProfitEstimate"] ?? "-"),
          _card("🧠 اعتماد AI", data["aiConfidence"] ?? "-"),
          _card("🚨 هشدار", data["warning"] ?? "-"),
        ],
      ),
    );
  }

  Widget _card(String title, String value) {
    return Card(
      color: const Color(0xFF111C33),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: Text(
          value.toString(),
          style: const TextStyle(
            color: Colors.greenAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}