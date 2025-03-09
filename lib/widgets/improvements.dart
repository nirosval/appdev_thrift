import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For platform checks

void main() {
  runApp(const ThrifterApp());
}

// ======================= THEME & CONSTANTS =======================
const _primaryColor = Color(0xFFA48C60);
const _scaffoldBackground = Color(0xFFD0BB94);

final appTheme = ThemeData(
  primaryColor: _primaryColor,
  scaffoldBackgroundColor: _scaffoldBackground,
  textTheme: const TextTheme(
    headlineMedium: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: _primaryColor,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      overlayColor: Colors.black12, // Ripple effect
    ),
  ),
);

// ======================= MAIN APP =======================
class ThrifterApp extends StatelessWidget {
  const ThrifterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
      home: const SplashScreen(),
    );
  }
}

// ======================= REUSABLE WIDGETS =======================
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}

class AuthTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;

  const AuthTextField({
    required this.label,
    this.obscureText = false,
    this.keyboardType,
    this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      obscuringCharacter: '•',
      keyboardType: keyboardType,
      autofillHints: autofillHints,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) => value!.isEmpty ? 'This field is required' : null,
    );
  }
}

// ======================= SPLASH SCREEN =======================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Schedule after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _precacheImage();
      _navigateToWelcome();
    });
  }

  void _precacheImage() {
    precacheImage(const AssetImage('assets/icons/Thrift.png'), context);
  }

  void _navigateToWelcome() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/welcome');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/Thrift.png',
              errorBuilder: (ctx, error, stack) => const Icon(Icons.error),
              width: 250,
              height: 150,
              fit: BoxFit.contain,
              semanticLabel: 'Thrifter Logo',
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}

// ======================= WELCOME SCREEN =======================
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: _primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/icons/Thrift.png',
                  width: size.width * 0.8,
                  semanticLabel: 'Thrifter App Logo',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: "Login",
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                  ),
                  const SizedBox(width: 20),
                  CustomButton(
                    text: "Sign Up",
                    onPressed: () => Navigator.pushNamed(context, '/signup'),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

// ======================= LOGIN SCREEN =======================
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Color
          Container(
            width: screenWidth,
            color: _scaffoldBackground,
          ),

          // Background Image
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
                errorBuilder: (ctx, error, stack) => const SizedBox.shrink(),
              ),
            ),
          ),

          // Logo
          Positioned(
            left: screenWidth * 0.26,
            top: screenHeight * 0.1,
            child: Image.asset(
              'assets/icons/Thrift.png',
              width: screenWidth * 0.4,
              height: screenHeight * 0.12,
              fit: BoxFit.contain,
              semanticLabel: 'App Logo',
            ),
          ),

          // Login Form Container
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
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.black87
                        ),
                      ),
                      const SizedBox(height: 30),

                      AuthTextField(
                        label: "Email",
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: [AutofillHints.email],
                      ),
                      const SizedBox(height: 20),

                      AuthTextField(
                        label: "Password",
                        obscureText: true,
                        autofillHints: [AutofillHints.password],
                      ),
                      const SizedBox(height: 15),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: _handleForgotPassword,
                          child: const Text("Forgot password?"),
                        ),
                      ),

                      ElevatedButton(
                        onPressed: _handleLogin,
                        child: const Text("Login"),
                      ),
                      const SizedBox(height: 25),

                      // Social login section
                      const Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text("or connect with"),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 20),

                      IconButton(
                        icon: Image.asset(
                          "assets/icons/Google.png",
                          semanticLabel: 'Google login',
                        ),
                        onPressed: _handleGoogleLogin,
                      ),
                      const SizedBox(height: 20),

                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/signup'),
                        child: RichText(
                          text: const TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(color: Colors.black54),
                            children: [
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement login logic
    }
  }

  void _handleForgotPassword() {
    // TODO: Implement password reset
  }

  void _handleGoogleLogin() {
    // TODO: Implement Google sign-in
  }
}

// ======================= SIGNUP SCREEN =======================
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add sign-up functionality here
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}