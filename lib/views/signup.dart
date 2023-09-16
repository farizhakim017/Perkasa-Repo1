// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print, unused_element, unused_catch_clause

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:perkasa1/components/mytextfield.dart';
import 'package:perkasa1/home_page.dart';
import 'package:perkasa1/views/registerpage.dart';
import 'package:perkasa1/views/setup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/mybutton2.dart';
import 'askusername.dart';
import 'forgorpage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Google sign-in controller
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Text editing controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Check if the user has completed the setup
  Future<bool> _checkSetupStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isSetupComplete') ?? false;
  }

  // Check if the username is available
  Future<bool> _checkUsernameAvailability() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') != null;
  }

  // Update the setup status to indicate completion
  Future<void> _updateSetupStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSetupComplete', true);
  }

  // Sign user in with Google
  Future<void> _handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        // Check the setup status
        bool isSetupComplete = await _checkSetupStatus();

        if (isSetupComplete) {
          // Navigate to the home page or desired screen
          Navigator.pushReplacementNamed(context, '/HomePage');
        } else {
          // Navigate to the setup page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                username: '',
              ), // Open the setup page
            ),
          );
        }
      }
    } catch (error) {
      print('Google Sign-In Error: $error');
      // Handle the sign-in error
    }
  }

  // Sign user in with email and password
  Future<void> _handleEmailSignIn() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Check the setup status
      bool isSetupComplete = await _checkSetupStatus();

      // Check if the user has a username
      bool isUsernameAvailable = await _checkUsernameAvailability();

      if (isSetupComplete) {
        // Navigate to the home page
        Navigator.pushReplacementNamed(context, '/HomePage');
      } else {
        if (isUsernameAvailable) {
          // User has a username, navigate to the setup page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SetupPage(),
            ),
          );
        } else {
          // User doesn't have a username, navigate to the AskUsername page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AskUsernamePage(),
            ),
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      // ... (remaining code is the same as before)
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Perkasa.',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  'Salam, \nTuan \nHamba',
                  style: GoogleFonts.quicksand(
                      fontSize: 63, color: Color(0xFF321C8B)),
                ),
              ),
              const SizedBox(height: 30),
              MyTextField(
                controller: _emailController,
                hintText: 'E-mel',
                obsecureText: false,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: _passwordController,
                hintText: 'Kata Laluan',
                obsecureText: true,
              ),
              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ForgotPasswordPage();
                          }),
                        );
                      },
                      child: Text(
                        'Lupa kata laluan?',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _isLoading ? null : _handleEmailSignIn,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          ),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator()
                            : const Text(
                                'Log Masuk',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'ataupun',
                        style: GoogleFonts.quicksand(fontSize: 12),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              MyButton2(
                onTap: () {
                  _handleGoogleSignIn();
                },
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'masih baru?',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: const Text(
                      'daftar masuk sekarang !',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
