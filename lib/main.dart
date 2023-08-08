// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:perkasa1/firebase_options.dart';
import 'package:perkasa1/home_page.dart';
import 'package:perkasa1/intro/intro_page.dart';
import 'package:perkasa1/views/askusername.dart';
import 'package:perkasa1/views/authpage.dart';
import 'package:perkasa1/views/setup.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seenIntro = prefs.getBool('seenIntro') ?? false;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp(seenIntro: seenIntro));
}

class MyApp extends StatelessWidget {
  final bool seenIntro;

  const MyApp({Key? key, required this.seenIntro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'perkasa',
      routes: {
        '/HomePage': (context) => HomePage(username: ''),
        '/SetupPage': (context) => SetupPage(),
        '/AskUsernamePage': (context) => AskUsernamePage(),
        '/SignUpPage': (context) => SignUpPage(),
        '/IntroScreen': (context) => IntroScreen(),
        '/AuthPage': (context) => AuthPage(),
      },
      home: seenIntro ? AuthPage() : IntroScreen(),
    );
  }
}
