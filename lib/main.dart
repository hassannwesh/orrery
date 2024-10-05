import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const OrreryApp());
}

class OrreryApp extends StatelessWidget {
  const OrreryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Orrery',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home:const HomeScreen(),
    );
  }
}