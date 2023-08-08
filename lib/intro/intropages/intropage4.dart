// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage4 extends StatelessWidget {
  const IntroPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 5),
              child: Text(
                'Banyak lagi yang perlu anda terokai..',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                alignment: Alignment.center,
                width: 500,
                height: 500,
                child: Lottie.network(
                    'https://assets10.lottiefiles.com/packages/lf20_P9CLOgR2NG.json',
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
