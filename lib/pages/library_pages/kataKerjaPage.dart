// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class kataKerjaPage extends StatelessWidget {
  const kataKerjaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'kata kerja',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
