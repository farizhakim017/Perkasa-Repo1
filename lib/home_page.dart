// ignore_for_file: library_private_types_in_public_api, avoid_function_literals_in_foreach_calls, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, use_build_context_synchronously, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:perkasa1/components/easteregg/TicTacToe.dart';
import 'package:perkasa1/pages/drawer_pages/whatisperkasa.dart';
import 'package:perkasa1/pages/profile.dart';
import 'package:perkasa1/pages/pustaka.dart';
import 'package:perkasa1/pages/realhomepage.dart';
import 'package:perkasa1/pages/translatepage.dart';

import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required String username}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 1;
  int _selectedIndex = 1;
  bool _showBottomNavigationBar = true;
  final ScrollController _scrollController = ScrollController();

  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _showBottomNavigationBar = true;
        });
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _showBottomNavigationBar = false;
        });
      }
    });
  }

  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _tabList = [
    PustakaPage(),
    RealHomePage(),
    TranslatePage(),
    ProfilePage(),
  ];

  //page to be showed

  // ignore: unused_field
  final List<Widget> _pages = [
    PustakaPage(),
    RealHomePage(),
    ProfilePage(),
  ];

  // List of app bar colors for each page
  final List<Color> _appBarColors = [
    Colors.white,
    Color(0xFFF4F4F4),
    Colors.white,
  ];

  // document IDs
  List<String> docIDs = [];

  // get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('tajuk').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIDs.add(document.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.menu,
                color: Color(0xFF321C8B),
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text(
          'Perkasa.',
          style: TextStyle(
            color: Color(0xFF321C8B),
          ),
        ),
        actions: _selectedIndex == 1
            ? [
                // Add the icon only for the RealHomePage
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: IconButton(
                      icon: Icon(
                        Icons.person,
                        color: Color(0xFF321C8B),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ]
            : null,
        backgroundColor: _appBarColors[_selectedIndex],
        elevation: 0,
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
/////////  logo perkasa at the header drawer  //////////////////

            Column(
              children: [
                DrawerHeader(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                      width: 350,
                      height: 350,
                      child:
                          Image.asset('assets/images/perkasa-logo(full).png')),
                )),

                ////  what is perkasa button    ///////////

                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 10, right: 10, bottom: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFD6E1FF),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => testPage(
                                      key: null,
                                    )),
                          );
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.info_outline,
                            color: Colors.black,
                            size: 25,
                          ),
                          title: Text('Apa itu perkasa?'),
                          textColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFD6E1FF),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => testPage()),
                          );
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.star_outline,
                            color: Colors.black,
                            size: 25,
                          ),
                          title: Text('Pendapat anda?'),
                          textColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFD6E1FF),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => testPage()),
                          );
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.star_outline,
                            color: Colors.black,
                            size: 25,
                          ),
                          title: Text('Pendapat anda?'),
                          textColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            ///////// version button //////////////////

            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 8),
                  child: GestureDetector(
                    onLongPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TicTacToe()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFD6E1FF),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 3),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: ListTile(
                          leading: Icon(Icons.verified, color: Colors.black),
                          title: Text('Versi 1.0.0'),
                          textColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),

                // Log Keluar button
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
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      bottom: 25,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFD6E1FF),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 3),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 5, right: 5, top: 5, bottom: 5),
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
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          _tabList.elementAt(_pageIndex),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Align(
              alignment: Alignment(0.0, 1.0),
              child: AnimatedOpacity(
                opacity: _showBottomNavigationBar ? 1.0 : 0.0,
                duration: Duration(milliseconds: 300),
                child: Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 2,
                      bottom: 2,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xFF321C8B),
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BottomNavigationBar(
                          elevation: 0,
                          backgroundColor: Colors.black,
                          selectedItemColor: Color(0xFF321C8B),
                          unselectedItemColor: Colors.grey,
                          showSelectedLabels: false,
                          showUnselectedLabels: false,
                          currentIndex: _pageIndex,
                          onTap: (int index) {
                            setState(() {
                              _pageIndex = index;
                            });
                          },
                          items: [
                            BottomNavigationBarItem(
                              icon: Icon(Icons.all_inbox),
                              label: "Pustaka",
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.home),
                              label: "Utama",
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.g_translate_outlined),
                              label: "Terjemah",
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.person),
                              label: "Profil",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
