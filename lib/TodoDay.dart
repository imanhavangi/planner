import 'dart:ui';

import 'package:flutter/material.dart';

enum TaskType {
  work,
  study,
  social,
  rest,
  entertainment,
  sport,
  other,
}
enum Necessity{
  mandatory,
  optional,
}
enum Period{
  morning,
  afternoon,
  night,
}
class TodoDay{
  String title;
  bool readOnly;
  bool done;
  Color doneColor;
  int time;
  TaskType taskType;
  Necessity necessity;
  Period period;

  TodoDay(String title, bool readOnly, bool done, int time, TaskType taskType, Necessity necessity, Period period){
    this.title = title;
    this.readOnly = readOnly;
    this.done = done;
    this.time = time;
    this.taskType = taskType;
    this.necessity = necessity;
    this.period = period;
    this.doneColor = Colors.white;
  }
}