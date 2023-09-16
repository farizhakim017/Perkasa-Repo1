// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perkasa1/pages/savedpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LikedContainer {
  final String content;
  final Widget pageToNavigate;

  LikedContainer({required this.pageToNavigate, required this.content});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LikedContainer &&
          runtimeType == other.runtimeType &&
          content == other.content;

  @override
  int get hashCode => content.hashCode;
}

class ContohKaranganPage extends StatefulWidget {
  @override
  _ContohKaranganPageState createState() => _ContohKaranganPageState();
}

class _ContohKaranganPageState extends State<ContohKaranganPage> {
  List<LikedContainer> likedContainers = [];
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadLikedContainers();
  }

  void _loadLikedContainers() async {
    _prefs = await SharedPreferences.getInstance();
    final savedLikedContainers = _prefs.getStringList('likedContainers') ?? [];
    setState(() {
      likedContainers = savedLikedContainers
          .map((content) => LikedContainer(
                content: content,
                pageToNavigate: _getPageForContent(content),
              ))
          .toList();
    });
  }

  Widget _getPageForContent(String content) {
    switch (content) {
      case 'Kelebihan Membaca':
        return KelebihanMembaca();
      case 'Kelebihan Melancong':
        return KelebihanMelancong();
      case 'Kelebihan Menabung':
        return KelebihanMenabung();
      // Add more cases for other content and pages
      default:
        return Container(); // Default to an empty container if not found
    }
  }

  void _toggleLike(String content) {
    setState(() {
      if (likedContainers.any((container) => container.content == content)) {
        likedContainers
            .removeWhere((container) => container.content == content);
      } else {
        likedContainers.add(LikedContainer(
          content: content,
          pageToNavigate: _getPageForContent(content),
        ));
      }
      _saveLikedContainers();
    });
  }

  void _removeLikedContainer(int index) {
    likedContainers.removeAt(index);
    _saveLikedContainers();
    setState(() {
      // Find the content of the removed item and update the button state
      final removedContent = likedContainers[index].content;
      _toggleLike(removedContent);
    });
  }

  void _saveLikedContainers() {
    final likedContentList =
        likedContainers.map((container) => container.content).toList();
    _prefs.setStringList('likedContainers', likedContentList);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Perkasa.',
            style: TextStyle(
              color: Color(0xFF321C8B),
            ),
          ),
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            child: Column(
              children: [
                Align(
                  child: TabBar(
                    isScrollable: true,
                    labelPadding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 0,
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Tab(icon: Center(child: Icon(Icons.list))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Tab(icon: Icon(Icons.bookmark)),
                      ),
                    ],
                    indicatorColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                child: Text(
                                  "Contoh \nKarangan Terbaik",
                                  style: GoogleFonts.robotoSlab(fontSize: 30),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 30, bottom: 5),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => KelebihanMembaca()),
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
                                height: 70,
                                child: Stack(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            'Kelebihan Membaca',
                                            style: GoogleFonts.robotoSlab(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        )),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: IconButton(
                                          icon: Icon(Icons.favorite),
                                          color: likedContainers.any(
                                                  (container) =>
                                                      container.content ==
                                                      'Kelebihan Membaca')
                                              ? Colors.red
                                              : Color(0xFF321C8B),
                                          onPressed: () {
                                            _toggleLike('Kelebihan Membaca');
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 5, bottom: 5),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          KelebihanMelancong()),
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
                                height: 70,
                                child: Stack(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            'Kelebihan Melancong',
                                            style: GoogleFonts.robotoSlab(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        )),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: IconButton(
                                          icon: Icon(Icons.favorite),
                                          color: likedContainers.any(
                                                  (container) =>
                                                      container.content ==
                                                      'Kelebihan Melancong')
                                              ? Colors.red
                                              : Color(0xFF321C8B),
                                          onPressed: () {
                                            _toggleLike('Kelebihan Melancong');
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 5, bottom: 5),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          KelebihanMenabung()),
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
                                height: 70,
                                child: Stack(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            'Kelebihan Menabung',
                                            style: GoogleFonts.robotoSlab(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        )),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: IconButton(
                                          icon: Icon(Icons.favorite),
                                          color: likedContainers.any(
                                                  (container) =>
                                                      container.content ==
                                                      'Kelebihan Menabung')
                                              ? Colors.red
                                              : Color(0xFF321C8B),
                                          onPressed: () {
                                            _toggleLike('Kelebihan Menabung');
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 5, bottom: 5),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          KelebihanMenabung()),
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
                                height: 70,
                                child: Stack(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            'Kelebihan Menabung',
                                            style: GoogleFonts.robotoSlab(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        )),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: IconButton(
                                          icon: Icon(Icons.favorite),
                                          color: likedContainers.any((container) =>
                                                  container.content ==
                                                  'Kelebihan Menjaga Kebersihan')
                                              ? Colors.red
                                              : Color(0xFF321C8B),
                                          onPressed: () {
                                            _toggleLike(
                                                'Kelebihan Menjaga Kebersihan');
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      LikedPage(likedContainers, _removeLikedContainer)
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

//semua containers yang dekat KaranganPage punya content//

class KelebihanMembaca extends StatefulWidget {
  KelebihanMembaca({super.key});

  @override
  State<KelebihanMembaca> createState() => _KelebihanMembacaState();
}

class _KelebihanMembacaState extends State<KelebihanMembaca> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Hee")),
      ),
    );
  }
}

class KelebihanMelancong extends StatefulWidget {
  KelebihanMelancong({super.key});

  @override
  State<KelebihanMelancong> createState() => _KelebihanMelancongState();
}

class _KelebihanMelancongState extends State<KelebihanMelancong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Huu")),
      ),
    );
  }
}

class KelebihanMenabung extends StatefulWidget {
  const KelebihanMenabung({super.key});

  @override
  State<KelebihanMenabung> createState() => _KelebihanMenabungState();
}

class _KelebihanMenabungState extends State<KelebihanMenabung> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Hoo")),
      ),
    );
  }
}
