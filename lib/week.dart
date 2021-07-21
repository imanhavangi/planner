import 'package:flutter/material.dart';

class Week extends StatefulWidget {

  const Week();

  @override
  _WeekState createState() => _WeekState();
}

class _WeekState extends State<Week> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'WEEK',
      ),
    );
  }
}
