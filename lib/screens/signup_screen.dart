import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void handleSignUp() {
    // Implement Sign Up logic here
    print("Sign Up with: ${emailController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD0BB94),
      body: Stack(
        children: [
          // Background Image
          Positioned(
            left: 38.82,
            top: -97,
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

          // Form Container
          Positioned(
            left: 0,
            top: 187,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 187,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF816635),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Input Fields
                  CustomTextField(hint: "Email", controller: emailController),
                  CustomTextField(hint: "User name", controller: usernameController),
                  CustomTextField(hint: "Password", controller: passwordController, obscureText: true),
                  CustomTextField(hint: "Confirm Password", controller: confirmPasswordController, obscureText: true),
                  CustomTextField(hint: "Phone", controller: phoneController),

                  const SizedBox(height: 20),

                  // Sign Up Button (Using CustomButton)
                  CustomButton(
                    text: "Sign Up",
                    onPressed: handleSignUp,
                  ),

                  const Spacer(),

                  // Back to Login Button
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "← Back to login",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF816635),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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
