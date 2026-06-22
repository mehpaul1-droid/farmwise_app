import 'package:flutter/material.dart';
import '../core/pdf_api.dart';

class PdfReportPage extends StatefulWidget {
  const PdfReportPage({super.key});

  @override
  State<PdfReportPage> createState() => _PdfReportPageState();
}

class _PdfReportPageState extends State<PdfReportPage> {

  Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    data = await PdfApi.getReport();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFF0B1220),

      appBar: AppBar(
        title: const Text("گزارش PDF جهاد کشاورزی"),
      ),

      body: data == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [

                _card("تعداد دام", data!["livestock"].toString()),
                _card("تعداد فارم", data!["farms"].toString()),
                _card("درآمد", data!["income"].toString()),
                _card("هزینه", data!["cost"].toString()),
                _card("صرفه‌جویی SHI", data!["shi"].toString()),
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
