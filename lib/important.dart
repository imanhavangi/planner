import 'package:flutter/cupertino.dart';

class important {
  String title;
  bool done;
  IconData icon;
  Color iconColor;
  bool readOnly;
  TextEditingController controller;

  important(String title, bool done, IconData icon, Color iconColor, bool readOnly){
    this.title = title;
    this.done = done;
    this.icon = icon;
    this.iconColor = iconColor;
    this.readOnly = readOnly;
    controller = new TextEditingController();
  }
}