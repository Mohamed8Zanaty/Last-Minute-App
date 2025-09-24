

import 'package:flutter/material.dart';
import 'ui/screens/findclinicsscreen/find_clinics_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clinics Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const FindClinicsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
