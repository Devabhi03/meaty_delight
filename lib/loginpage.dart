import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meaty_delight/main_page.dart'; // For successful login redirection
import 'package:meaty_delight/firstpage.dart'; // For incorrect login redirection

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordHidden = true;
  bool _isEmailValid = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false; // For showing a loading indicator during API call

  void _togglePasswordView() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  void _checkEmailValidity() {
    setState(() {
      _isEmailValid = RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_emailController.text);
    });
  }

  // Function to handle API login
  Future<void> _login() async {
    const url =
        'https://assetx.kgninfo.com/api/login'; // Replace with your API URL

    setState(() {
      _isLoading = true; // Show loading while making the request
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': _emailController.text, // User's email
          'password': _passwordController.text, // User's password
        }),
      );

      setState(() {
        _isLoading = false; // Hide loading after the request completes
      });

      if (response.statusCode == 200) {
        // Login success - user exists in the API database
        var data = jsonDecode(response.body);
        print('Login successful: $data');

        // Navigate to MainPage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      } /*else if (response.statusCode == 401) {
        // Unauthorized: Invalid credentials, redirect to FirstPage()
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const FirstPage()),
        );
      }*/
      else {
        // Other error responses
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: ${response.body}')),
        );

        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => const FirstPage()),
        // );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error during login: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/logo.png',
                height: 80,
              ),
              const SizedBox(height: 10),
              const Text(
                'Meat your happiness',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),

              // Email TextField
              TextField(
                controller: _emailController,
                onChanged: (text) => _checkEmailValidity(),
                decoration: InputDecoration(
                  labelText: 'Email',
                  suffixIcon: _isEmailValid
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Password TextField
              TextField(
                controller: _passwordController,
                obscureText: _isPasswordHidden,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: _togglePasswordView,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Show loading indicator when logging in
              if (_isLoading) const CircularProgressIndicator(),

              // Log In Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: _isLoading
                    ? null
                    : _login, // Call the login method when pressed
                child: const Text('LOG IN'),
              ),
              const SizedBox(height: 30),

              // Log In with Google and Apple Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Add Google login logic
                    },
                    child: Image.asset(
                      'assets/google.png',
                      height: 50,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      // Add Apple login logic
                    },
                    child: Image.asset(
                      'assets/apple.png',
                      height: 50,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // "Don't have an account?" section
              GestureDetector(
                onTap: () {
                  // Navigate to the sign-up page
                },
                child: const Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Create Account Now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
