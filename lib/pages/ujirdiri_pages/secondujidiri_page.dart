// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api, deprecated_member_use, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class SecondUjiDiriPage extends StatefulWidget {
  const SecondUjiDiriPage({Key? key}) : super(key: key);

  @override
  _SecondUjiDiriPageState createState() => _SecondUjiDiriPageState();
}

class _SecondUjiDiriPageState extends State<SecondUjiDiriPage> {
  final StopWatchTimer _stopwatchTimer = StopWatchTimer();
  bool _isRunning = false;

  @override
  void dispose() {
    _stopwatchTimer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 250),
            StreamBuilder<int>(
              stream: _stopwatchTimer.rawTime,
              initialData: 0,
              builder: (context, snapshot) {
                final value = snapshot.data!;
                final displayTime = StopWatchTimer.getDisplayTime(value,
                    hours: false, minute: true, second: true);
                return Text(
                  displayTime.substring(0, 5),
                  style: const TextStyle(fontSize: 40),
                );
              },
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Color(0xFF321C8B),
                      width: 4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF321C8B),
                        offset: Offset(6, 6),
                        blurRadius: 0,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (_isRunning) {
                            _isRunning = false;
                            _stopwatchTimer.onExecute
                                .add(StopWatchExecute.stop);
                          } else {
                            _isRunning = true;
                            _stopwatchTimer.onExecute
                                .add(StopWatchExecute.start);
                          }
                        });
                      },
                      child: Icon(
                        _isRunning ? Icons.pause : Icons.play_arrow,
                        size: 36,
                        color: Colors.blue,
                      ),
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(48, 48))),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Color(0xFF321C8B),
                      width: 4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF321C8B),
                        offset: Offset(6, 6),
                        blurRadius: 0,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: const Text(
                        'Set semula',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(Size(120, 48))),
                      onPressed: () {
                        setState(() {
                          _isRunning = false;
                        });
                        _stopwatchTimer.onExecute.add(StopWatchExecute.reset);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
