import 'package:flutter/material.dart';

class AppTheme {

  static const backgroundImage =
      "https://images.unsplash.com/photo-1500595046743-cd271d694d30";

  static const Color overlay = Color(0xAA0B1220);

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
    ),
  );
}
