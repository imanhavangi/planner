import 'package:flutter/cupertino.dart';

class Important {
  String title;
  bool done;
  IconData icon;
  Color iconColor;
  bool readOnly;
  TextEditingController controller;
  Color doneColor;

  Important(String title, bool done, IconData icon, Color iconColor, bool readOnly, Color doneColor){
    this.title = title;
    this.done = done;
    this.icon = icon;
    this.iconColor = iconColor;
    this.readOnly = readOnly;
    controller = new TextEditingController();
    this.doneColor = doneColor;
  }
}