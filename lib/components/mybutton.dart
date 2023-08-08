// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatefulWidget {
  final Function()? onTap;
  const MyButton({super.key, required this.onTap});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  // text editing controller //
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign user in
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: signIn,
      child: Container(
        padding: EdgeInsets.all(18),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Color(0xFFEA67FF),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Colors.black,
              width: 3,
            )),
        child: Center(
          child: Text(
            "Log Masuk!",
            style: GoogleFonts.quicksand(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
