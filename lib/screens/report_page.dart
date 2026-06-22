import 'package:flutter/material.dart';
import '../core/report_api.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {

  Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    data = await ReportApi.getReport();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),

      appBar: AppBar(
        title: const Text("گزارش فارم"),
      ),

      body: data == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [

                _card("تعداد فارم", data!["farm_count"].toString()),
                _card("تعداد دام", data!["livestock_count"].toString()),
                _card("درآمد", data!["income"].toString()),
                _card("هزینه", data!["cost"].toString()),
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
