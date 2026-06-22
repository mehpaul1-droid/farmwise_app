import 'package:flutter/material.dart';

import 'dashboard_page.dart';
import 'report_page.dart';
import 'pdf_report_page.dart';
import '../modules/livestock/livestock_page.dart';
import 'shi_screen.dart';
import 'farms_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int index = 0;

  final pages = [
    DashboardPage(),
    LivestockPage(),
    Center(child: Text("خوراک")),
    SHIScreen(),
    FarmsPage(),
    ReportPage(),
    PdfReportPage(), // 🔥 جدید
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFF0B1220),

      appBar: AppBar(
        title: const Text("FarmWise System"),
      ),

      drawer: Drawer(
        child: Container(
          color: const Color(0xFF0B1220),
          child: ListView(
            children: [

              const DrawerHeader(
                child: Text("FarmWise Menu",
                    style: TextStyle(color: Colors.white)),
              ),

              _item("داشبورد", 0),
              _item("دام", 1),
              _item("خوراک", 2),
              _item("SHI", 3),
              _item("فارم‌ها", 4),
              _item("گزارش‌ها", 5),
              _item("PDF جهاد", 6), // 🔥 جدید
            ],
          ),
        ),
      ),

      body: pages[index],
    );
  }

  Widget _item(String title, int i) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () => setState(() => index = i),
    );
  }
}
