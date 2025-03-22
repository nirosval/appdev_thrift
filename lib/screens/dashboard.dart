import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? username;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUsername();
  }

  Future<void> fetchUsername() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');
    print("Retrieved Token: $token");
    if (token == null || token.isEmpty) {
      print("No authentication token found!");
      return;
    }
    try {
      var url = Uri.parse('http://localhost:5000/api/auth/user');
      var response = await http.get(
        url,
        headers: {
          'x-auth-token': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      print("Request Headers: ${response.request?.headers}");
      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        // Convert the JSON data to a Map
        var data = jsonDecode(response.body);

        // Extract the username from the response
        setState(() {
          username =
              data['username']; // <-- make sure this matches your backend response
          isLoading = false;
        });
      } else {
        print('Error fetching username: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('An error occurred: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child:
              isLoading
                  ? CircularProgressIndicator() // show loading while waiting for backend
                  : username != null
                  ? Text(
                    'Welcome to thrifter! ($username)',
                    style: TextStyle(fontSize: 20),
                  )
                  : Text('Failed to load username'), // error fallback
        ),
      ),
    );
  }
}
