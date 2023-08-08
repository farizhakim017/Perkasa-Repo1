// ignore_for_file: unused_local_variable, use_key_in_widget_constructors, use_build_context_synchronously, prefer_const_constructors, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perkasa1/views/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/mytextfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final bool _isLoading = false;

  Future<void> _registerUser(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Store additional user data in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'username': _usernameController.text.trim(),
        // Add other user data fields if needed
      });

      // Navigate to the homepage
      Navigator.pushReplacementNamed(context, '/HomePage');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showDialog(
          context: context,
          builder: (BuildContext dialogContext) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  20.0), // Set the border circular radius here
            ),
            title: Text('Pendaftaran terbatal'),
            content: Text(
                'Kata laluan terlalu lemah, cuba kata laluan yang lebih mantap (contoh kata laluan yang mantap mestilah panjang lebih dari 8 aksara terdiri daripada gabungan huruf dan nombor).'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        showDialog(
          context: context,
          builder: (BuildContext dialogContext) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  20.0), // Set the border circular radius here
            ),
            title: Text('Maaf, pendaftaran terbatal.'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('E-mel yang anda masukkan telah digunakan, daftar masuk?'),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/oh-no.jpg',
                  width: 150,
                  height: 150,
                )
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext dialogContext) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  20.0), // Set the border circular radius here
            ),
            title: Text('Mengapa terburu-buru'),
            content: Text(
                'Masukkan maklumat anda dahulu, tidak mengapa kerana kami sedia menunggu :)'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) => AlertDialog(
          title: Text('Pendaftaran terbatal'),
          content: Text('cuba sekali lagi'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF321C8B),
      appBar: AppBar(
        title: const Text(
          'Perkasa.',
          style: TextStyle(
            color: Colors.white,
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
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 35),
                child: Text(
                  'Salam \nPerkenalan, \nAyuh! \nDaftar Masuk.',
                  style:
                      GoogleFonts.quicksand(fontSize: 48, color: Colors.white),
                ),
              ),
              const SizedBox(height: 40),
              MyTextField(
                controller: _emailController,
                hintText: 'E-mel',
                obsecureText: false,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: _usernameController,
                hintText: 'Nama Pengguna',
                obsecureText: false,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: _passwordController,
                hintText: 'Kata Laluan',
                obsecureText: true,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: _passwordController,
                hintText: 'Sahkan Kata Laluan',
                obsecureText: true,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!_isLoading) {
                          _registerUser(context);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xFFD6E1FF),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          ),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator()
                            : const Text(
                                'Daftar Masuk',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'sudah mempunyai akaun?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: const Text(
                      'log masuk sekarang !',
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
