import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Color
          Container(
            width: 411,
            height: 869,
            color: const Color(0xFFD0BB94),
          ),

          // Background Image
          Positioned(
            left: -40,
            top: -40,
            child: Transform.rotate(
              angle: -16 * (3.1415926535 / 180),
              child: Image.asset(
                'assets/icons/backgroundimage.png',
                width: 500,
                height: 500,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Logo (X: 105, Y: 89)
          Positioned(
            left: 105,
            top: 89,
            child: Image.asset(
              'assets/icons/Thrifter.png', // Updated path
              width: 172,
              height: 106,
              fit: BoxFit.contain,
            ),
          ),

          // "Hello" Text (X: 28, Y: 142)
          Positioned(
            left: 28,
            top: 142,
            child: const Text(
              "Hello",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          // "Welcome back" Text (X: 36, Y: 205)
          Positioned(
            left: 36,
            top: 205,
            child: const Text(
              "Welcome back",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),

          // White Login Container (Adjusted to 869px height)
          Positioned(
            left: 0,
            top: 310,
            child: Container(
              width: 411,
              height: 559,
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
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Email & Password Fields
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Column(
                      children: [
                        // Email Field
                        SizedBox(
                          width: 310,
                          height: 60,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 53),

                        // Password Field
                        SizedBox(
                          width: 310,
                          height: 60,
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),

          // Forgot Password (X: 264, Y: 592, W: 106, H: 8) - Adjusted to fit 869px
          Positioned(
            left: 264,
            top: 592,
            child: SizedBox(
              width: 106,
              height: 8,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(106, 8),
                  alignment: Alignment.centerRight,
                ),
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),

          // Login Button (X: 72, Y: 629, W: 285, H: 41) - Adjusted
          Positioned(
            left: 72,
            top: 629,
            child: SizedBox(
              width: 285,
              height: 41,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA48C60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),

          // "Connect with" Border (X: 69, Y: 703, W: 285, H: 11) - Adjusted
          Positioned(
            left: 69,
            top: 703,
            child: SizedBox(
              width: 285,
              height: 11,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 100, height: 1, color: Colors.black26),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "or connect with",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(width: 100, height: 1, color: Colors.black26),
                ],
              ),
            ),
          ),

          // Google Login Button (X: 202, Y: 744, W: 23.47, H: 23.47) - Adjusted
          Positioned(
            left: 202,
            top: 744,
            child: GestureDetector(
              onTap: () {
                // Handle Google Sign-In
              },
              child: Image.asset(
                "assets/icons/Google.png",
                width: 23.47,
                height: 23.47,
              ),
            ),
          ),

          // "Don’t have an account? Sign Up" (X: 125, Y: 798, W: 179, H: 21) - Adjusted
          Positioned(
            left: 125,
            top: 798,
            child: SizedBox(
              width: 179,
              height: 21,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "Don’t have an account? ",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
