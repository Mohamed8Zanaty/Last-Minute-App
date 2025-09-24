import 'package:flutter/material.dart';
import 'package:last_minute/ui/splashscreen/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoCare',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Add your custom theme data here
      ),
      home: const SplashScreen(),
      // If you want to remove the debug banner
      debugShowCheckedModeBanner: false,
    );
  }
}