import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perkasa1/pages/pustakapage/karangan/contohkarangan.dart';

class LikedPage extends StatelessWidget {
  final List<LikedContainer> likedContainers;
  final Function(int) onRemoveLikedContainer;

  LikedPage(this.likedContainers, this.onRemoveLikedContainer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 20),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Color(0xFF321C8B),
              child: Container(
                child: Text(
                  "Simpanan",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          likedContainers.isEmpty
              ? Column(
                  children: [
                    SizedBox(height: 150),
                    Image.asset(
                      'assets/images/not_find.png',
                      width: 160,
                      height: 160,
                    ),
                    SizedBox(height: 19),
                    Align(
                      child: Container(
                        child: Text(
                          "Tiada Sebarang Simpanan.. \nCuba Simpan Sesuatu?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: likedContainers.length,
                    itemBuilder: (context, index) {
                      final container = likedContainers[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => container.pageToNavigate,
                            ),
                          );
                        },
                        child: Dismissible(
                          key: Key(container.content),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                          onDismissed: (direction) {
                            onRemoveLikedContainer(index);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 5, bottom: 5),
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
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    container.content,
                                    style: GoogleFonts.robotoSlab(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
