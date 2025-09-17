import 'package:flutter/material.dart';
import 'screens/ai_health_check_page.dart'; // <-- path to the page you pasted

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Health Check',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const AiHealthCheckPage(), // <-- page shown at launch
    );
  }
}
