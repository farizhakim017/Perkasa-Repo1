// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdatePage extends StatefulWidget {
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final TextEditingController _usernameController = TextEditingController();
  bool _isLoading = false;

  Future<void> _updateUsername() async {
    if (_usernameController.text.trim().isEmpty) {
      // Display an error message or show a snackbar if the username is empty
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({
          'username': _usernameController.text.trim(),
        });
      }
      // Display a success message or show a snackbar upon successful update

      // Navigate back to the previous page or any desired destination
      Navigator.pop(context);
    } catch (error) {
      // Handle any error that occurred during the update process
      // Display an error message or show a snackbar
    } finally {
      setState(() {
        _isLoading = false;
      });
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Kemaskini Nama Pengguna Anda',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading ? null : _updateUsername,
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Text('Setuju'),
            ),
          ],
        ),
      ),
    );
  }
}
