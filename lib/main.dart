// lib/main.dart
import 'package:flutter/material.dart';

// If notifications_page.dart is in lib/:
import 'ui/screens/notifications.dart';

// If it's in lib/pages/, use:
// import 'pages/notifications_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifications Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const NotificationsPage(),
    );
  }
}
