import 'package:flutter/material.dart';
import '../core/dashboard_api.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  Map<String, dynamic>? data;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    try {
      data = await DashboardApi.getDashboard();
    } catch (e) {
      data = {
        "income": 0,
        "cost": 0,
        "shi_saving": 0,
        "profit": 0
      };
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),

      appBar: AppBar(
        title: const Text("داشبورد فارم"),
      ),

      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [

                _card("درآمد کل", data!["income"].toString()),
                _card("هزینه کل", data!["cost"].toString()),
                _card("صرفه‌جویی SHI", data!["shi_saving"].toString()),
                _card("سود نهایی", data!["profit"].toString()),
              ],
            ),
    );
  }

  Widget _card(String t, String v) {
    return Card(
      color: Colors.white10,
      child: ListTile(
        title: Text(t, style: const TextStyle(color: Colors.white)),
        trailing: Text(
          v,
          style: const TextStyle(
            color: Colors.greenAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
