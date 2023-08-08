// ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/mytextfield.dart';
import '../home_page.dart';

class AskUsernamePage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();

  Future<void> _saveUsername(BuildContext context) async {
    String username = _usernameController.text.trim();
    if (username.isNotEmpty) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Store the username in Firestore
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'username': username,
        });

        // Navigate to the HomePage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage(username: username)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "Anda mahu dikenali sebagai?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 30),
            MyTextField(
              controller: _usernameController,
              hintText: 'Nama Pengguna (Username)',
              obsecureText: false,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveUsername(context),
              child: Text('Selesai'),
            ),
          ],
        ),
      ),
    );
  }
}
