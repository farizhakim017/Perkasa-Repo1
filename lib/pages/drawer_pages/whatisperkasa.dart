import 'package:flutter/material.dart';

class testPage extends StatelessWidget {
  const testPage({super.key});

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
        automaticallyImplyLeading: false,
      ),
    );
  }
}
