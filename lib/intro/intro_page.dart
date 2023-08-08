import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  Future<void> _setIntroSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenIntro', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Intro Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Intro Screen!'),
            ElevatedButton(
              onPressed: () async {
                await _setIntroSeen(); // Mark intro as seen
                Navigator.pushReplacementNamed(context, '/AuthPage');
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
