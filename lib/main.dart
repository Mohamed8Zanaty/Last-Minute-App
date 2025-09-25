

import 'package:flutter/material.dart';
import 'package:last_minute/ui/screens/aihealthcheckscreen/ai_health_check_screen.dart';
import 'package:last_minute/ui/screens/chatscreen/ChatScreen.dart';
import 'package:last_minute/ui/screens/homescreen/HomeScreen.dart';
import 'package:last_minute/ui/screens/medicalrecordsscreen/medical_records_page.dart';
import 'package:last_minute/ui/screens/notificationsscreen/notifications.dart';
import 'package:last_minute/ui/screens/profilescreen/ProfileScreen.dart';
import 'package:last_minute/ui/screens/signupscreen/SignupScreen.dart';
import 'package:last_minute/ui/screens/splashscreen/SplashScreen.dart';
import 'ui/screens/findclinicsscreen/find_clinics_screen.dart';

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
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/signup': (context) => SignupScreen(),
        '/home': (context) =>  const HomeScreen(),
        '/ai_health_check': (context) => const AiHealthCheckPage(),
        '/find_clinics': (context) => const FindClinicsScreen(),
        '/medical_records': (context) => const MedicalRecordsPage(),
        '/notifications': (context) => const NotificationsPage(),
        '/profile': (context) =>  ProfileScreen(),
        '/chat': (context) =>  Chatscreen(),
      },
    );
  }
}


