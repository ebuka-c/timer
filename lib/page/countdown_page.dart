import 'dart:async';

import 'package:flutter/material.dart';

class CountdownPage extends StatefulWidget {
  const CountdownPage({Key? key}) : super(key: key);

  @override
  State<CountdownPage> createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  //
  Duration duration = Duration();
  Timer? timer;

//
  @override
  void initState() {
    super.initState();

    startTimer();
  }

  void addTime() {
    final addSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: seconds);
    });
  }

//
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Text(
      '$minutes:$seconds',
      style: TextStyle(fontSize: 80),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildTime(),
      ),
    );
  }
}
