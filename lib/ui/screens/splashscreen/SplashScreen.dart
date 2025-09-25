import 'package:flutter/material.dart';
import 'Logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to signup after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/signup');
    });
  }

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
                color: const Color(0xFF4B0082),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              "Health & Hope in One Place",
              style: TextStyle(
                fontSize: 20,
                color: const Color(0xFF9370DB).withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}