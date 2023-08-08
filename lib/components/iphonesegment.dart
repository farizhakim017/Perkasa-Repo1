import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IPhoneLikeSegmentedControl extends StatefulWidget {
  @override
  _IPhoneLikeSegmentedControlState createState() =>
      _IPhoneLikeSegmentedControlState();
}

class _IPhoneLikeSegmentedControlState
    extends State<IPhoneLikeSegmentedControl> {
  int _currentSegment = 0;
  final Map<int, Widget> _segments = const {
    0: Text('Option 1'),
    1: Text('Option 2'),
    2: Text('Option 3'),
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoSegmentedControl<int>(
      children: _segments,
      onValueChanged: (int value) {
        setState(() {
          _currentSegment = value;
        });
      },
      groupValue: _currentSegment,
      borderColor: Colors.transparent,
      selectedColor: Colors.blue,
      unselectedColor: Colors.white,
    );
  }
}
