import 'package:flutter/material.dart';
import 'package:meaty_delight/loginpage.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isEmailValid = false;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset('assets/logo.png', height: 100),

            const SizedBox(height: 20),

            // First Name
            const TextField(
              decoration: InputDecoration(labelText: 'First name'),
            ),

            // Last Name
            const TextField(
              decoration: InputDecoration(labelText: 'Last name'),
            ),

            // Email Field
            TextField(
              controller: _emailController,
              onChanged: (value) {
                setState(() {
                  _isEmailValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Email',
                suffixIcon: _isEmailValid
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
              ),
            ),

            // Password Field
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(_isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Log In Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: const Text('LOG IN'),
            ),

            // Social Media Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/google.png',
                    height: 40,
                    width: 40,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Image.asset(
                    'assets/apple.png',
                    height: 40,
                    width: 40,
                  ),
                ),
              ],
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: const Text("Already have an account? Log In Now"),
            ),
          ],
        ),
      ),
    );
  }
}
