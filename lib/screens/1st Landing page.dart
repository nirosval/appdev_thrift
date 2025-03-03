import 'package:flutter/material.dart';

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

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA48C60), // Background color from Figma
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Image.asset(
              'assets/icons/Thrift.png',
              width: constraints.maxWidth * (248.26 / 411), // Responsive width
              height: constraints.maxHeight * (153 / 869), // Responsive height
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
