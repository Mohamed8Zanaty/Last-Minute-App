import 'package:flutter/material.dart';
import 'package:last_minute/ui/screens/aihealthcheck/ai_health_check_screen.dart';
import 'package:last_minute/ui/screens/book/book_screen.dart';
import 'package:last_minute/ui/screens/chat/ChatScreen.dart';
import 'package:last_minute/ui/screens/findclinics/find_clinics_screen.dart';
import 'package:last_minute/ui/screens/home/HomeScreen.dart';
import 'package:last_minute/ui/screens/login/login_screen.dart';
import 'package:last_minute/ui/screens/medicalrecords/medical_records_page.dart';
import 'package:last_minute/ui/screens/notifications/notifications.dart';
import 'package:last_minute/ui/screens/profile/ProfileScreen.dart';
import 'package:last_minute/ui/screens/settings/settings_screen.dart';
import 'package:last_minute/ui/screens/signup/SignupScreen.dart';
import 'package:last_minute/ui/screens/splash/SplashScreen.dart';
import 'package:last_minute/ui/screens/wellness_offers/wellness_offers_screen.dart';

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
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/ai_health_check': (context) => const AiHealthCheckPage(),
        '/find_clinics': (context) => const FindClinicsScreen(),
        '/medical_records': (context) => const MedicalRecordsPage(),
        '/notifications': (context) => const NotificationsPage(),
        '/profile': (context) => ProfileScreen(),
        '/chat': (context) => Chatscreen(),
        '/book': (context) => const BookScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/wellness_offers': (context) => const WellnessOffersScreen(),
      },
    );
  }
}