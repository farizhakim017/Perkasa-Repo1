// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_string_escapes, avoid_unnecessary_containers, unused_import

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perkasa1/pages/library.dart';
import 'package:perkasa1/pages/pustakapages/karanganpage.dart';
import 'package:perkasa1/pages/ujidiri.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/circular_button.dart';
import '../components/pustaka_pages/notadiri.dart';
import 'library_pages/golonganPeribahasa.dart';
import 'library_pages/golonganUngkapan.dart';

class PustakaPage extends StatefulWidget {
  const PustakaPage({super.key});

  @override
  State<PustakaPage> createState() => _PustakaPageState();
}

class _PustakaPageState extends State<PustakaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40, bottom: 30, top: 30),
              child: Text(
                "Laut ditimba \nTak Akan Kering.",
                style: GoogleFonts.coveredByYourGrace(fontSize: 47),
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  SizedBox(width: 25),
                  Column(
                    children: [
                      Container(
                        width: 170,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xFFD6E1FF),
                          border: Border.all(color: Colors.black, width: 3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.book,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.only(left: 5, top: 18),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Tatabahasa",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                alignment: Alignment.topLeft,
                                child:
                                    Text('Pelajari tatabahasa dihujung jari'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: 170,
                        height: 210,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xFFD6E1FF),
                          border: Border.all(color: Colors.black, width: 3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.notes_sharp,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.only(left: 5, top: 18),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Karangan",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                alignment: Alignment.topLeft,
                                child: Text('Kumpulan karangan terbaik'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        width: 170,
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xFFD6E1FF),
                          border: Border.all(color: Colors.black, width: 3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.chat_bubble_outline,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.only(left: 5, top: 18),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Mutiara Kata",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                alignment: Alignment.topLeft,
                                child:
                                    Text('Keindahan kata-kata, memberi rasa'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 15),
                  Column(
                    children: [
                      Container(
                        width: 170,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xFFD6E1FF),
                          border: Border.all(color: Colors.black, width: 3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.abc,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.only(left: 5, top: 18),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Peribahasa",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                alignment: Alignment.topLeft,
                                child: Text("Himpunan \n'Bak kata pepatah..'"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: 170,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xFFD6E1FF),
                          border: Border.all(color: Colors.black, width: 3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.design_services,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.only(left: 5, top: 18),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Uji Diri",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                alignment: Alignment.topLeft,
                                child: Text('Topik apa hari ni?'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: 170,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xFFD6E1FF),
                          border: Border.all(color: Colors.black, width: 3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.border_color,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.only(left: 5, top: 18),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Nota Diri",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                alignment: Alignment.topLeft,
                                child: Text('Nota sendiri'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
