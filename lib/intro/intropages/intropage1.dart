// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  'Salam Perkenalan',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'ini adalah',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              child: Image.asset('assets/images/perkasa-logo(full).png'),
            ),
            SizedBox(height: 45),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '"Sebuah inisiatif memperkasa penggunaan \nBahasa Melayu dalam bentuk aplikasi mudah alih."',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
