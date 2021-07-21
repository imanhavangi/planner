import 'package:flutter/material.dart';

class Day extends StatefulWidget {

  const Day();

  @override
  _DayState createState() => _DayState();
}

class _DayState extends State<Day> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'DAY',
      ),
    );
  }
}
