// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, use_build_context_synchronously, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, no_leading_underscores_for_local_identifiers, avoid_print, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perkasa1/intro/intro_page.dart';
import 'package:perkasa1/views/forgorpage.dart';
import 'package:perkasa1/views/updatepage.dart';

import '../main.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key});

  final user = FirebaseAuth.instance.currentUser!;

  void _showRatingDialog(BuildContext context) {
    double _rating = 0.0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pada pendapat anda'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Berapa bintang untuk Perkasa?'),
              SizedBox(height: 16),
              RatingBar(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                ratingWidget: RatingWidget(
                  full: Icon(Icons.star, color: Color(0xFF321C8B)),
                  half: Icon(Icons.star_half, color: Color(0xFF321C8B)),
                  empty: Icon(Icons.star_border, color: Color(0xFF321C8B)),
                ),
                onRatingUpdate: (rating) {
                  _rating = rating;
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('BATAL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('TERUSKAN'),
              onPressed: () {
                Navigator.of(context).pop();
                _showThankYouDialog(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showThankYouDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Terima Kasih'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('atas ulasan ikhlas dan jujur anda!'),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/thank-you.jpg',
                width: 150,
                height: 150,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;

    return StreamBuilder<DocumentSnapshot>(
      stream:
          FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: CircularProgressIndicator());
        }

        // Retrieve the user data from the snapshot
        final userData = snapshot.data!.data() as Map<String, dynamic>?;

        if (userData == null) {
          // Handle the case where userData is null
          return Text('User data not available');
        }

        final String? username = userData['username'] as String?;

        if (username == null) {
          // Handle the case where username is null
          return Text('Username not available');
        }

        return Scaffold(
          body: ListView(padding: const EdgeInsets.all(18.0), children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black)),
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 50,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    username,
                    style: GoogleFonts.questrial(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFD6E1FF),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.black,
                              size: 17,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Kemaskini profil',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _showRatingDialog(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFD6E1FF),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        child: Row(
                          children: [
                            Text(
                              'Nilaikan Perkasa?',
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFF321C8B),
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF321C8B),
                    offset: Offset(8, 8),
                    blurRadius: 0,
                    spreadRadius: 1,
                  ),
                ],
              ),
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  Text("Maklumat Anda", textAlign: TextAlign.center),
                  SizedBox(height: 55),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "e-mel : " + user.email!,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.questrial(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Divider(
                    thickness: 2,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "kata laluan : *******",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.questrial(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPasswordPage()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Color(0xFFD6E1FF),
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFD6E1FF),
                                  offset: Offset(4, 4),
                                  blurRadius: 0,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "ubah kata laluan?",
                                style: TextStyle(
                                  color: Color(0xFF321C8B),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 110),
                ],
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyApp(
                            seenIntro: true,
                          )),
                  (Route<dynamic> route) => false,
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 3, right: 3, bottom: 3),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFD6E1FF),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 3),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(5, 5),
                        blurRadius: 0,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: ListTile(
                      leading: Icon(
                        Icons.logout_outlined,
                        color: Colors.black,
                      ),
                      title: Text('Log Keluar'),
                      textColor: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IntroScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 3, right: 3, bottom: 3),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 3),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(5, 5),
                        blurRadius: 0,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: ListTile(
                      leading: Icon(
                        Icons.logout_outlined,
                        color: Colors.black,
                      ),
                      title: Text('onboardingtest'),
                      textColor: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}

void _showRatingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(75.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(75.0),
          child: AlertDialog(
            title: Text('Rate the App'),
            content: Text('How would you rate this app?'),
            actions: <Widget>[
              TextButton(
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('RATE'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _showAppreciationDialog(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _showAppreciationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Thank You'),
        content: Text('We appreciate your feedback!'),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
