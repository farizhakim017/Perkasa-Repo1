// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/info.dart';

class HomieButton extends StatefulWidget {
  @override
  _HomieButtonState createState() => _HomieButtonState();
}

class _HomieButtonState extends State<HomieButton> {
  int _currentSelection = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoSegmentedControl<int>(
          children: {
            0: Padding(
              // Add padding around the text
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Perkataan',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF321C8B)),
              ),
            ),
            1: Padding(
              // Add padding around the text
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Peribahasa',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF321C8B)),
              ),
            ),
            2: Padding(
              // Add padding around the text
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Pembetulan',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF321C8B)),
              ),
            ),
          },
          onValueChanged: (int index) {
            setState(() {
              _currentSelection = index;
            });
          },
          groupValue: _currentSelection,
          borderColor: Color(0xFF321C8B),
          selectedColor: Color(0xFFD6E1FF),
          unselectedColor: Colors.grey[200],
        ),
        SizedBox(height: 25),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            final offsetAnimation = Tween<Offset>(
              begin: Offset(_currentSelection == 0 ? -1.0 : 1.0, 0),
              end: Offset(0, 0),
            ).animate(animation);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          child: _buildSelectedContent(),
        ),
      ],
    );
  }

  Widget _buildSelectedContent() {
    switch (_currentSelection) {
      case 0:
        ///////////////////////////Perkataan box//////////////////////////////////
        return SafeArea(
          child: tajukperkataan(context: context),
        );
      ///////////////////////////Peribahasa box//////////////////////////////////
      case 1:
        return PepatahBox();
      ////////////////kesalahan norma box///////////////////////////
      case 2:
        return Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Container(
            key: ValueKey(2),
            width: double.infinity,
            padding: EdgeInsets.only(left: 10, right: 5, bottom: 10, top: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Color(0xFF321C8B),
                width: 6,
              ),
            ),
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('kesalahan_norma')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading...');
                    }

                    if (snapshot.hasData) {
                      final documents = snapshot.data!.docs;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          final document = documents[index];
                          // Display data from the document
                          return ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 15, top: 15),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: Color(0xFF321C8B),
                                      width: 3,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFF321C8B),
                                        offset: Offset(5, 5),
                                        blurRadius: 0,
                                        spreadRadius: 1,
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    document['tajuk_kn'],
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.questrial(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }

                    return Text('No data available');
                  },
                ),
                SizedBox(width: 30),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('kesalahan_norma')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading...');
                    }

                    if (snapshot.hasData) {
                      final documents = snapshot.data!.docs;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          final document = documents[index];
                          // Display data from the document
                          return ListTile(
                            title: Text(
                              document['apa_kn'],
                              style: GoogleFonts.questrial(
                                fontSize: 17,
                              ),
                            ),
                          );
                        },
                      );
                    }

                    return Text('No data available');
                  },
                ),
                SizedBox(width: 30),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('kesalahan_norma')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading...');
                    }

                    if (snapshot.hasData) {
                      final documents = snapshot.data!.docs;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          final document = documents[index];
                          // Display data from the document
                          return ListTile(
                            title: Text(
                              document['kesalahan'],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.questrial(
                                fontSize: 17,
                              ),
                            ),
                          );
                        },
                      );
                    }

                    return Text('No data available');
                  },
                ),
                SizedBox(width: 30),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('kesalahan_norma')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading...');
                    }

                    if (snapshot.hasData) {
                      final documents = snapshot.data!.docs;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          final document = documents[index];
                          // Display data from the document
                          return ListTile(
                            title: Text(
                              document['pembetulan'],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.questrial(
                                fontSize: 17,
                              ),
                            ),
                          );
                        },
                      );
                    }

                    return Text('No data available');
                  },
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
        );
      default:
        return Container(); // Default content when _currentSelection has an invalid value
    }
  }
}

class PepatahBox extends StatelessWidget {
  const PepatahBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          key: ValueKey(2),
          padding: const EdgeInsets.all(0),
          child: Column(
            key: ValueKey(2),
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color.fromARGB(255, 118, 83, 255),
                    width: 2,
                  ),
                ),
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('peribahasa')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading...');
                    }

                    if (snapshot.hasData) {
                      final documents = snapshot.data!.docs;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          final document = documents[index];
                          // Display data from the document
                          return ListTile(
                            title: Text(
                              document['renjanapb'],
                              style: GoogleFonts.questrial(fontSize: 17),
                            ),
                          );
                        },
                      );
                    }

                    return Text('No data available');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GestureDetector(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 118, 83, 255),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('peribahasa')
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text('Loading...');
                            }

                            if (snapshot.hasData) {
                              final documents = snapshot.data!.docs;
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: documents.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final document = documents[index];
                                  // Display data from the document
                                  return ListTile(
                                    title: Text(
                                      document['tajukpb'],
                                      style: GoogleFonts.robotoSlab(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 25.0),
                                      child: Text(
                                        document['maksudpb'],
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[200],
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.all(18),
                                  );
                                },
                              );
                            }

                            return Text('No data available');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class tajukperkataan extends StatelessWidget {
  const tajukperkataan({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            width: double.infinity,
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('tajuk').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Loading...');
                }
                if (snapshot.hasData) {
                  final documents = snapshot.data!.docs;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics:
                              NeverScrollableScrollPhysics(), // Disable scrolling
                          itemCount: documents.length,
                          itemBuilder: (BuildContext context, int index) {
                            final document = documents[index];
                            // Return Card widget instead of ListTile
                            return ListTile(
                              title: Padding(
                                padding: const EdgeInsets.all(0),
                                child: Text(
                                  document['renjana'],
                                  style: GoogleFonts.questrial(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF321C8B)),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }

                return Text('No data available');
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: PerkataanHariniBox(context: context),
        ),
      ],
    );
  }
}

class PerkataanHariniBox extends StatelessWidget {
  const PerkataanHariniBox({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoPage()),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border:
                Border.all(color: Color.fromARGB(255, 118, 83, 255), width: 2),
            boxShadow: [
              BoxShadow(
                blurRadius: 30,
                offset: Offset(-10, -10),
                color: Colors.white,
              ),
              BoxShadow(
                blurRadius: 30,
                offset: Offset(10, 10),
                color: Colors.white,
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('tajuk').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('');
                  }

                  if (snapshot.hasData) {
                    final documents = snapshot.data!.docs;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: documents.length,
                      itemBuilder: (BuildContext context, int index) {
                        final document = documents[index];
                        // Display data from the document
                        return ListTile(
                          title: Text(
                            document['title'],
                            style: GoogleFonts.robotoSlab(
                                fontSize: 35,
                                color: Color.fromARGB(255, 118, 83, 255)),
                          ),
                        );
                      },
                    );
                  }

                  return Text('No data available');
                },
              ),
              SizedBox(height: 3),

              //jawi
              StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('tajuk').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading...');
                  }

                  if (snapshot.hasData) {
                    final documents = snapshot.data!.docs;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: documents.length,
                      itemBuilder: (BuildContext context, int index) {
                        final document = documents[index];
                        // Display data from the document
                        return ListTile(
                          title: Text(
                            document['jawi'],
                            textAlign: TextAlign.right,
                            style: GoogleFonts.quicksand(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 118, 83, 255)),
                          ),
                        );
                      },
                    );
                  }

                  return Text('No data available');
                },
              ),
              SizedBox(height: 9),

              //diskripsi
              StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('tajuk').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading...');
                  }

                  if (snapshot.hasData) {
                    final documents = snapshot.data!.docs;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: documents.length,
                      itemBuilder: (BuildContext context, int index) {
                        final document = documents[index];
                        // Display data from the document
                        return ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              document['diskripsi'],
                              style: GoogleFonts.quicksand(
                                  color: Color.fromARGB(255, 118, 83, 255),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return Text('No data available');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
