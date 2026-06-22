import 'package:flutter/material.dart';
import '../core/api_service.dart';

class AddLivestockPage extends StatefulWidget {
  const AddLivestockPage({super.key});

  @override
  State<AddLivestockPage> createState() => _AddLivestockPageState();
}

class _AddLivestockPageState extends State<AddLivestockPage> {

  final farmId = TextEditingController();
  final name = TextEditingController();
  final type = TextEditingController();
  final weight = TextEditingController();

  bool loading = false;

  void save() async {

    setState(() => loading = true);

    final ok = await ApiService.addLivestock(
      farmId: farmId.text,
      name: name.text,
      type: type.text,
      weight: double.tryParse(weight.text) ?? 0,
    );

    setState(() => loading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(ok ? "ثبت موفق" : "خطا")),
    );

    if (ok) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      appBar: AppBar(title: const Text("افزودن دام")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(controller: farmId,
                decoration: const InputDecoration(labelText: "Farm ID")),

            TextField(controller: name,
                decoration: const InputDecoration(labelText: "نام")),

            TextField(controller: type,
                decoration: const InputDecoration(labelText: "نوع")),

            TextField(controller: weight,
                decoration: const InputDecoration(labelText: "وزن")),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: loading ? null : save,
              child: Text(loading ? "..." : "ثبت"),
            )
          ],
        ),
      ),
    );
  }
}
