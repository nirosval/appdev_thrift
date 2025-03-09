import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import '../widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA48C60),
      body: Stack(
        children: [
          Positioned(
            left: 67,
            top: 105,
            child: Image.asset(
              'assets/icons/Thrift.png',
              width: 401,
              height: 247.13,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 60,
            top: 595,
            child: CustomButton(
              text: "Login",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ),
          Positioned(
            left: 200,
            top: 595,
            child: CustomButton(
              text: "Sign Up",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
