// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perkasa1/pages/library_pages/kataKerjaPage.dart';
import 'package:perkasa1/pages/searchup.dart';

import 'library_pages/KataNamaPage.dart';
import 'library_pages/kataAdjektifPage.dart';
import 'library_pages/kataTugas.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perkasa.',
          style: TextStyle(
            color: Color(0xFF321C8B),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchUpPage()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color(0xFF321C8B),
                  width: 4,
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
          SizedBox(height: 60),
          Text(
            'Golongan Kata',
            textAlign: TextAlign.center,
            style: GoogleFonts.questrial(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => kataNamaPage()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Text(
                        'kata \nnama',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide(width: 3, color: Colors.black),
                      ),
                      elevation: MaterialStateProperty.all(4),
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFF321C8B),
                      ), // Change the background color here
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => kataAdjektifPage()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Text(
                        'kata \nadjektif',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide(width: 3, color: Colors.black),
                      ),
                      elevation: MaterialStateProperty.all(4),
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFF321C8B),
                      ), // Change the background color here
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 3),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => kataKerjaPage()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Text(
                        'kata \nkerja',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide(width: 3, color: Colors.black),
                      ),
                      elevation: MaterialStateProperty.all(4),
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFF321C8B),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => kataTugasPage()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Text(
                        'kata \ntugas',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide(width: 3, color: Colors.black),
                      ),
                      elevation: MaterialStateProperty.all(4),
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFF321C8B),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 15,
            endIndent: 15,
          ),
          SizedBox(height: 40),
          Text(
            'Jenis Ayat',
            textAlign: TextAlign.center,
            style: GoogleFonts.questrial(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Text(
                        'ayat \npenyata',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide(width: 3, color: Colors.black),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFBECDFF)),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Text(
                        'ayat \ntanya',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide(width: 3, color: Colors.black),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFBECDFF)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 3),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Text(
                        'ayat \nseruan',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide(width: 3, color: Colors.black),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFBECDFF)),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Text(
                        'ayat \nperintah',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide(width: 3, color: Colors.black),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFBECDFF)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
