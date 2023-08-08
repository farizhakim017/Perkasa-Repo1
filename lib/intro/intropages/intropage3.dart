// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 85),
              child: Container(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Text(
                    'Pelajari tatabahasa dihujung jari',
                    textAlign: TextAlign.end,
                    style: GoogleFonts.quicksand(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              alignment: Alignment.topCenter,
              width: 370,
              height: 370,
              child: Image.asset(
                  'assets/images/sehari selembar benang (perf).png'),
            ),
            Container(
                child: Text(
              'setiap hari, anda mempelajari satu perkataan, \nperibahasa ataupun ungkapan menarik',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ))
          ],
        ),
      ),
    );
  }
}
