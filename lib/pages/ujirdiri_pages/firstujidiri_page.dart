// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Random Text Example')),
      body: Center(child: FirstUjiDiriPage()),
    ),
  ));
}

class FirstUjiDiriPage extends StatefulWidget {
  @override
  _FirstUjiDiriPageState createState() => _FirstUjiDiriPageState();
}

class _FirstUjiDiriPageState extends State<FirstUjiDiriPage> {
  List<String> strings = [
    '"Kelebihan menabung"',
    '"Kelebihan membaca"',
    '"Kelebihan melancong"',
    '"Punca kadar pengangguran meningkat"',
    '"Faktor pelajar tidak mahu melanjutkan pelajaran"',
  ];

  String randomString = '';

  void pickRandomString() {
    setState(() {
      randomString = ''; // Clear the result before picking a new random string
    });

    Timer(Duration(seconds: 1), () {
      setState(() {
        final random = Random();
        randomString = strings[random.nextInt(strings.length)];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 40),
            Container(
              child: Text(
                'Sila berikan..',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 5),
              ),
              child: SizedBox(
                width: 350, // Specify the desired width
                height: 380, // Specify the desired height
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            randomString,
                            style: TextStyle(fontSize: 40),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: pickRandomString,
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Color(0xFFD6E1FF),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(5, 5),
                      blurRadius: 0,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Text(
                  'Pilih tajuk rawak',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
