import 'package:flutter/material.dart';
import 'ai_control_center.dart';

void main() {
  runApp(const FarmWiseApp());
}

class FarmWiseApp extends StatelessWidget {
  const FarmWiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AIControlCenter(),
    );
  }
}