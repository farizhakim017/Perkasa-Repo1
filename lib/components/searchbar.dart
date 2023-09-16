import 'package:flutter/material.dart';

import '../pages/library.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen(BuildContext context, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> data = [
    'Kata kerja',
    'Kata adjektif',
    'Kata tugas',
    'Kata nama',
    'Ayat penyata',
    'Ayat tanya',
    'Ayat seruan',
    'Ayat perintah',
    // Add more data here...
  ];
  List<String> filteredData = [];

  @override
  void initState() {
    super.initState();
    filteredData = data;
  }

  void filterData(String query) {
    setState(() {
      filteredData = data
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void navigateToPage(String buttonName) {
    // Implement your navigation logic here
    // For example:
    if (buttonName == 'Kata kerja') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const kataKerjaPage()),
      );
    } else if (buttonName == 'Kata adjektif') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const kataAdjektifPage()),
      );
    } else if (buttonName == 'Kata tugas') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const kataTugasPage()),
      );
    } else if (buttonName == 'Kata nama') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const kataNamaPage()),
      );
    } else if (buttonName == 'Ayat penyata') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AyatPenyataPage()),
      );
    } else if (buttonName == 'Ayat perintah') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AyatPerintahPage()),
      );
    } else if (buttonName == 'Ayat tanya') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AyatTanyaPage()),
      );
    } else if (buttonName == 'Ayat seruan') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AyatSeruanPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              onChanged: filterData,
              decoration: const InputDecoration(
                labelText: 'Carian',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredData[index]),
                  onTap: () => navigateToPage(filteredData[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
