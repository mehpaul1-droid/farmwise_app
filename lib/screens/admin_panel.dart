import 'package:flutter/material.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("پنل مدیریت")),
      body: ListView(
        children: const [
          ListTile(title: Text("مدیریت کاربران")),
          ListTile(title: Text("مدیریت فارم‌ها")),
          ListTile(title: Text("گزارش کل سیستم")),
        ],
      ),
    );
  }
}
