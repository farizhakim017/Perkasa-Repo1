// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, prefer_interpolation_to_compose_strings, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:perkasa1/homiepage/homiebutton.dart';
import 'package:perkasa1/pages/searchup.dart';
import 'package:perkasa1/views/askusername.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

// ignore: must_be_immutable
class RealHomePage extends StatelessWidget {
  RealHomePage({Key? key}) : super(key: key);

// masa kat appbar punya controller
  String getGreeting(int hour) {
    if (hour >= 0 && hour < 12) {
      return 'Selamat Pagi,';
    } else if (hour >= 12 && hour < 17) {
      return 'Salam Petang,';
    } else {
      return 'Selamat Malam,';
    }
  }

// pull to refresh controller
  Future<void> _handleRefresh() async {
    return await Future.delayed(Duration(seconds: 1));
  }

  // document IDs
  List<String> docIDs = [];

  // get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('tajuk').get().then(
          // ignore: avoid_function_literals_in_foreach_calls
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIDs.add(document.reference.id);
          }),
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

          final userData = snapshot.data!.data() as Map<String, dynamic>?;

          if (userData == null) {
            // Navigate to AskUsernamePage if userData is null
            Future.delayed(Duration.zero, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AskUsernamePage()),
              );
            });
            return Container(); // Return an empty container while navigating
          }

          final String? username = userData['username'] as String?;

          if (username == null) {
            // Handle the case where username is null
            return Text('Username not available');
          }
          DateTime currentTime = DateTime.now();
          String greeting = getGreeting(currentTime.hour);

          return Scaffold(
            backgroundColor: Colors.transparent,
            body: LiquidPullToRefresh(
              onRefresh: _handleRefresh,
              color: Color(0xFf8FBDE8),
              height: 200,
              backgroundColor: Color(0xFF321C8B),
              animSpeedFactor: 3,
              showChildOpacityTransition: true,
              child: HomePages(greeting: greeting, username: username),
            ),
          );
        });
  }
}

class HomePages extends StatelessWidget {
  const HomePages({
    super.key,
    required this.greeting,
    required this.username,
  });

  final String greeting;
  final String? username;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            color: Colors.white,
            child: ListView(children: [
              Container(
                width: double.infinity,
                color: Color(0xFFD6E1FF),
                height: 140,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 8, top: 35),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text: greeting,
                              style: GoogleFonts.quicksand(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF321C8B),
                              ),
                            ),
                          ).animate().fade(duration: 700.ms),
                          Text(
                            (username ?? 'Guest') + ' 👋',
                            style: GoogleFonts.quicksand(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 118, 83, 255),
                            ),
                          ).animate().fade(duration: 700.ms),
                        ],
                      ),
                      SizedBox(width: 70),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: EdgeInsets.only(top: 10),
                          width: 150,
                          height: 150,
                          child: Lottie.network(
                              'https://assets3.lottiefiles.com/packages/lf20_6G1vvxxQaI.json'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFD6E1FF), Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.5,
                      0.5
                    ], // Adjust the stops to define the split position
                  ),
                ),
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchUpPage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color(0xFF321C8B),
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Text(
                            'Search',
                            style: GoogleFonts.questrial(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(
                  left: 25,
                ),
                child: Text(
                  'Sehari,',
                  style: GoogleFonts.quicksand(
                      color: Color(0xFF321C8B),
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ).animate().fade(duration: 700.ms),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  'Selembar Benang.',
                  style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 118, 83, 255),
                    fontSize: 25,
                  ),
                ).animate().fade(duration: 700.ms),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xFFF8F6F6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, top: 13, bottom: 4),
                    child: Column(
                      children: [
                        tajukperkataan(context: context),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Divider(thickness: 2),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFF8F6F6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, top: 13, bottom: 4),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PepatahBox(),
                        ),
                        SizedBox(height: 400),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1000),
            ])));
  }
}
