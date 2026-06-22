import 'package:flutter/material.dart';
import 'theme.dart';

class FarmBackground extends StatelessWidget {
  final Widget child;

  const FarmBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        // 🌿 background image
        Positioned.fill(
          child: Image.network(
            AppTheme.backgroundImage,
            fit: BoxFit.cover,
          ),
        ),

        // 🌑 dark overlay
        Positioned.fill(
          child: Container(
            color: AppTheme.overlay,
          ),
        ),

        // 📱 content
        child,
      ],
    );
  }
}
