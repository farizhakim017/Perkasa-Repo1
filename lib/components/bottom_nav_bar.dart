import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  final int selectedIndex;

  const MyBottomNavBar({
    Key? key,
    required this.onTabChange,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.1)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GNav(
          backgroundColor: Colors.transparent,
          color: Colors.grey[300],
          activeColor: Colors.grey[800],
          tabActiveBorder: Border.all(
            color: const Color(0xFF321C8B),
            style: BorderStyle.solid,
            width: 3,
          ),
          tabBackgroundColor: Colors.white,
          mainAxisAlignment: MainAxisAlignment.center,
          tabBorderRadius: 20,
          selectedIndex: selectedIndex,
          onTabChange: onTabChange,
          tabs: const [
            GButton(
              icon: Icons.all_inbox,
              text: ' Pustaka',
              margin: EdgeInsets.symmetric(horizontal: 5),
            ),
            GButton(
              icon: Icons.home,
              text: ' Utama',
              margin: EdgeInsets.symmetric(horizontal: 5),
            ),
            GButton(
              icon: Icons.person,
              text: ' Profil',
              margin: EdgeInsets.symmetric(horizontal: 5),
            ),
          ],
        ),
      ),
    );
  }
}
