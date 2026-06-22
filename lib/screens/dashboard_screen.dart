import 'package:flutter/material.dart';
import '../core/auth_service.dart';
import '../widgets/profit_advanced_chart.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {

    final role = AuthService.role ?? "user";

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),

      appBar: AppBar(
        title: const Text("سامانه هوشمند مدیریت فارم"),
        backgroundColor: const Color(0xFF1B5E20),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await AuthService.logout();
              Navigator.pushReplacementNamed(context, "/");
            },
          )
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // 💥 MAIN CHART
          const ProfitAdvancedChart(),

          const SizedBox(height: 20),

          _kpi("📈 درآمد کل", "125,000,000 تومان"),
          _kpi("💸 هزینه کل", "78,000,000 تومان"),
          _kpi("💰 سود خالص", "47,000,000 تومان"),

          const SizedBox(height: 20),

          _section("وضعیت سیستم", "فعال 🟢"),

          if (role == "admin") ...[
            _section("مدیریت کامل سیستم", "دسترسی کامل"),
            _section("کاربران", "کنترل شده"),
            _section("تنظیمات AI", "فعال"),
          ],

          if (role == "user") ...[
            _section("فارم شما", "در حال پایش"),
            _section("تحلیل AI", "فعال"),
          ],

          if (role == "operator") ...[
            _section("تولید", "در حال اجرا"),
            _section("وظایف", "فعال"),
          ],
        ],
      ),
    );
  }

  Widget _kpi(String title, String value) {
    return Card(
      color: const Color(0xFF111C33),
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Colors.white70)),
        trailing: Text(
          value,
          style: const TextStyle(color: Colors.greenAccent),
        ),
      ),
    );
  }

  Widget _section(String title, String value) {
    return Card(
      color: const Color(0xFF1E293B),
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Colors.white70)),
        trailing: Text(value, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
