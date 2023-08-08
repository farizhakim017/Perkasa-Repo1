// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton2 extends StatelessWidget {
  final Function()? onTap;
  const MyButton2({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(18),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Colors.black,
              width: 3,
            )),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/google-image.png',
                  width: 30, // Specify the desired width
                  height: 30, // Specify the desired height
                ),
                SizedBox(width: 8),
                Text(
                  'Log masuk melalui akaun Google',
                  style: GoogleFonts.questrial(
                      color: Colors.black45,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
