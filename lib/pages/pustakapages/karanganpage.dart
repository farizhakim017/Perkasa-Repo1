// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KaranganPage extends StatelessWidget {
  const KaranganPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF321C8B),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
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
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 40),
            child: Container(
              child: Text(
                'Pilihan Kumpulan \nKarangan Terbaik.',
                textAlign: TextAlign.left,
                style: GoogleFonts.coveredByYourGrace(fontSize: 40),
              ),
            ),
          ),
          SizedBox(height: 30),
          karanganboxes(
            text: "Kepentingan dan Kebaikan Menjaga Kebersihan",
          ),
          karanganboxes(
            text: "Kebaikan Melancong Keluar Negara",
          ),
          karanganboxes(
            text: "Punca-Punca Pengangguran dan Cara Mengatasinya",
          ),
          karanganboxes(
            text: "Persediaan Menempuh Alam Pekerjaan",
          ),
          karanganboxes(
            text: "Ciri-Ciri Pekerja Cemerlang",
          ),
          karanganboxes(
            text: "Peranan Belia Dalam Pembangunan Negara",
          ),
        ]));
  }
}

class karanganboxes extends StatelessWidget {
  final String text;
  const karanganboxes({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFD6E1FF),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            (text),
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
