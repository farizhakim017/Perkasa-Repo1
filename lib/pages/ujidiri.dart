// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:perkasa1/pages/ujirdiri_pages/firstujidiri_page.dart';
import 'package:perkasa1/pages/ujirdiri_pages/secondujidiri_page.dart';

class UjiDiriPage extends StatefulWidget {
  const UjiDiriPage({super.key});

  @override
  State<UjiDiriPage> createState() => _UjiDiriPageState();
}

class _UjiDiriPageState extends State<UjiDiriPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
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
              'Uji Diri.',
              style: TextStyle(
                color: Color(0xFF321C8B),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          body: Column(children: [
            TabBar(
              indicatorColor: Colors.blue,
              labelColor: Colors.purple,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.design_services,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.timer,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Expanded(
                child: TabBarView(
                    children: [FirstUjiDiriPage(), SecondUjiDiriPage()]))
          ]),
        ));
  }
}
