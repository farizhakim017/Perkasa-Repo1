// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:perkasa1/pages/library.dart';
import 'package:perkasa1/pages/pustakapage/karangan/karanganpage.dart';
import 'package:perkasa1/pages/pustakapages/karanganpage.dart';
import 'package:perkasa1/pages/savedpage.dart';

class PustakaPage extends StatelessWidget {
  const PustakaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    isScrollable: true,
                    labelPadding: const EdgeInsets.only(
                      left: 0,
                      right: 10,
                      bottom: 10,
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Center(child: Tab(text: 'Pemahaman')),
                      Center(child: Tab(text: 'Karangan')),
                    ],
                    labelStyle: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    indicatorColor: Colors.grey,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      LibraryPage(),
                      KarangannPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
