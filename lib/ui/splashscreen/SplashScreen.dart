// splash_screen.dart
import 'package:flutter/material.dart';

import 'Logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(),
            const SizedBox(height: 24),
            Text(
              "SoCare",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4B0082), // DeepIndigo
              ),
            ),
            const SizedBox(height: 18),
            Text(
              "Health & Hope in One Place",
              style: TextStyle(
                fontSize: 20,
                color: const Color(0xFF9370DB).withOpacity(0.8), // MediumPurple with alpha
              ),
            ),
          ],
        ),
      ),
    );
  }
}