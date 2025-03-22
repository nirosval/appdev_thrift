import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
// static const String baseUrl = 'http://10.0.2.2:5000/api/auth/register'; // Use this for Android emulator
 static const String baseUrl = 'http://localhost:5000/api'; // Use this for iOS simulator

  // Register a new user
  static Future<Map<String, dynamic>?> registerUser(String username, String email, String password, {String? phone}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
          if (phone != null) 'phone': phone,
        }),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        // Save token to shared preferences
        await _saveToken(data['token']);
        return data;
      } else {
        print('Registration failed: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error during registration: $e');
      return null;
    }
  }

  // Login user
  static Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        // Save token to shared preferences
        await _saveToken(data['token']);
        return data;
      } else {
        print('Login failed: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error during login: $e');
      return null;
    }
  }

  // Get user profile
  static Future<Map<String, dynamic>?> getUserProfile() async {
    try {
      final token = await _getToken();

      if (token == null) {
        print('No authentication token found');
        return null;
      }

      final response = await http.get(
        Uri.parse('$baseUrl/auth/user'),
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': token,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Failed to get user profile: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error getting user profile: $e');
      return null;
    }
  }

  // Logout user
  static Future<bool> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('auth_token');
      return true;
    } catch (e) {
      print('Error during logout: $e');
      return false;
    }
  }

  // Helper methods
  static Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  static Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
}
