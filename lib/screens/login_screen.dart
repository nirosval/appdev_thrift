import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            color: const Color(0xFFD0BB94),
          ),
          Positioned(
            left: -40,
            top: -40,
            child: Transform.rotate(
              angle: -16 * (3.1415926535 / 180),
              child: Image.asset(
                'assets/icons/backgroundimage.png',
                width: screenWidth * 1.2,
                height: screenHeight * 0.5,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: screenWidth * 0.26,
            top: screenHeight * 0.1,
            child: Image.asset(
              'assets/icons/Thrifter.png',
              width: screenWidth * 0.4,
              height: screenHeight * 0.12,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: screenWidth * 0.07,
            top: screenHeight * 0.18,
            child: const Text(
              "Hello",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          Positioned(
            left: screenWidth * 0.09,
            top: screenHeight * 0.24,
            child: const Text(
              "Welcome back",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
          Positioned(
            left: 0,
            top: screenHeight * 0.35,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.65,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.75,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFA48C60),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {},
                      child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Container(height: 1, color: Colors.black26)),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("or connect with", style: TextStyle(fontSize: 12)),
                      ),
                      Expanded(child: Container(height: 1, color: Colors.black26)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset("assets/icons/Google.png", width: 24, height: 24),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: "Don’t have an account? ",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
