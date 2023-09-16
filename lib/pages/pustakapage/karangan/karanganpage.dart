import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:perkasa1/pages/pustakapage/karangan/contohkarangan.dart';

class KarangannPage extends StatefulWidget {
  const KarangannPage({super.key});

  @override
  State<KarangannPage> createState() => _KarangannPageState();
}

class _KarangannPageState extends State<KarangannPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContohKaranganPage()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Text(
                      "Contoh Karangan Terbaik",
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)),
                )
                    .animate()
                    .fadeIn()
                    .scale()
                    .move(delay: 700.ms, duration: 600.ms)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Text(
                    "Contoh Karangan Terbaik",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black)),
              )
                  .animate()
                  .fadeIn(delay: 500.ms, duration: 600.ms)
                  .scale()
                  .move(delay: 800.ms, duration: 700.ms),
            ),
          ),
        ],
      ),
    );
  }
}
