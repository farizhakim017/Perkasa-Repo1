// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_build_context_synchronously, unused_element, avoid_print, unused_field

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<bool> _checkSetupStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isSetupComplete') ?? false;
  }

  Future<void> _updateSetupStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSetupComplete', true);
  }

  Future<void> _handleEmailSignIn() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Sign user in with email and password
      // Your authentication logic here

      // Check the setup status
      bool isSetupComplete = await _checkSetupStatus();

      if (isSetupComplete) {
        // Navigate to the home page or desired screen
        Navigator.pushReplacementNamed(context, '/HomePage');
      } else {
        // Navigate to the setup page
        Navigator.pushReplacementNamed(context, '/SetupPage');
      }
    } catch (error) {
      print('Sign-In Error: $error');
      // Handle the sign-in error
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Your Scaffold widget properties
      body: Column(
        children: [
          // Your UI components
          // ...

          ElevatedButton(
            onPressed: _isLoading ? null : _handleEmailSignIn,
            child: Text('Sign In'),
          ),
        ],
      ),
    );
  }
}

class SetupPage extends StatefulWidget {
  const SetupPage({Key? key}) : super(key: key);

  @override
  _SetupPageState createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final TextEditingController _usernameController = TextEditingController();

  Future<void> _updateSetupStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSetupComplete', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Setup'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter your username:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  String username = _usernameController.text.trim();

                  // Perform validation if needed
                  if (username.isNotEmpty) {
                    // Save the username
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString('username', username);

                    // Update the setup status
                    await _updateSetupStatus();

                    // Navigate to the home page or desired screen
                    Navigator.pushReplacementNamed(context, '/HomePage');
                  }
                },
                child: Text('Finish Setup'),
              ),
            ],
          ),
        ));
  }
}
