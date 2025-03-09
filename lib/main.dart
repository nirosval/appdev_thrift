import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const ThrifterApp());
}

class ThrifterApp extends StatelessWidget {
  const ThrifterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
