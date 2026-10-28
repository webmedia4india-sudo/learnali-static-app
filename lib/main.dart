import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const LearnliApp());
}

class LearnliApp extends StatelessWidget {
  const LearnliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}