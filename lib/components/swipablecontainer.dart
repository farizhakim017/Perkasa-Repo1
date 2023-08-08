import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SwipableContainer extends StatefulWidget {
  @override
  _SwipableContainerState createState() => _SwipableContainerState();
}

class _SwipableContainerState extends State<SwipableContainer> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 220,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(seconds: 2),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        onPageChanged: (index, reason) {
          setState(() {});
        },
      ),
      items: [
        Container(),
        Container(),
      ],
    );
  }
}
