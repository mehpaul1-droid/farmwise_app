import 'package:flutter/material.dart';
import '../../core/api_service.dart';
import '../add_livestock_page.dart';

class LivestockPage extends StatefulWidget {
  const LivestockPage({super.key});

  @override
  State<LivestockPage> createState() => _LivestockPageState();
}

class _LivestockPageState extends State<LivestockPage> {

  List data = [];
  bool loading = true;

  void load() async {
    data = await ApiService.getLivestock();
    setState(() => loading = false);
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),

      appBar: AppBar(
        title: const Text("مدیریت دام"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddLivestockPage(),
            ),
          ).then((_) => load());
        },
        child: const Icon(Icons.add),
      ),

      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, i) {
                final item = data[i];

                return Card(
                  color: Colors.white10,
                  child: ListTile(
                    title: Text(item[2].toString(),
                        style: const TextStyle(color: Colors.white)),
                    subtitle: Text(
                      "نوع: ${item[3]} | وزن: ${item[4]}",
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
