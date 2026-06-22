import 'package:flutter/material.dart';
import 'ai_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  final pages = const [
    Center(child: Text("📊 داشبورد اصلی")),
    Center(child: Text("🐄 مدیریت دام")),
    Center(child: Text("🐔 مدیریت طیور")),
    AIScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("شهر پروتئین ایران")),

      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text("منو اصلی"),
            ),
            ListTile(
              title: const Text("داشبورد"),
              onTap: () => setState(() => index = 0),
            ),
            ListTile(
              title: const Text("دام"),
              onTap: () => setState(() => index = 1),
            ),
            ListTile(
              title: const Text("طیور"),
              onTap: () => setState(() => index = 2),
            ),
            ListTile(
              title: const Text("AI تحلیل فارم"),
              onTap: () => setState(() => index = 3),
            ),
          ],
        ),
      ),

      body: pages[index],
    );
  }
}
