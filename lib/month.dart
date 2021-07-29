import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:auto_direction/auto_direction.dart';
import 'package:planner/Important.dart';
import 'dart:ui' as ui;

import 'package:planner/TodoDay.dart';

class Month extends StatefulWidget {

  const Month();

  @override
  _MonthState createState() => _MonthState();
}


class _MonthState extends State<Month> {

  void initState(){
    print("salam");
  }

  String _chosenValue;
  bool _isReadOnly = true;
  DateTime _dateTime = DateTime.now();
  String text = "";
  List<Important> importants = new List<Important>();
  List<TodoDay> todoDays = new List<TodoDay>();
  var myController = TextEditingController();

  // List<IconData> importantIcon = List<IconData>.generate(100, (index) => Icons.save);
  // List<Color> importantIconColor = List<Color>.generate(100, (index) => Colors.red);
  // List<bool> importantReadOnly = List<bool>.generate(100, (index) => false);

  void _creat(String title, bool done){
    Important imp = new Important("", false, Icons.save, Colors.red, false, Colors.white);
    importants.add(imp);
  }
  void _createTodoDay(){
    TodoDay todoDay = new TodoDay("", false, false, 60, TaskType.study, Necessity.mandatory, Period.morning);
    todoDays.add(todoDay);
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _dateTime, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _dateTime)
      setState(() {
        _dateTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Container(
              height: 50,
              padding: EdgeInsets.only(left: 15, right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey.shade300,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // SizedBox(width: 15,),
                  Text("${DateFormat('EEE, d MMM yyy').format(_dateTime)}",
                    style: TextStyle(fontSize: 17),
                  ),
                  // SizedBox(width: 150),
                  IconButton(onPressed: () => _selectDate(context), icon: Icon(Icons.date_range), iconSize: 30, color: Colors.blueAccent,),
                ],
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Row(
              children: <Widget>[
                Container(
                  height: 25,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    color: Colors.grey,
                  ),
                  alignment: Alignment.center,
                  child: Text('Summary'),
                ),
                Container(
                  height: 25,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    color: Colors.blue,
                  ),
                  child: IconButton(icon: Icon(Icons.edit), iconSize: 20, alignment: Alignment.center, padding: EdgeInsets.only(top: 1),
                    onPressed: () {setState(() {
                      _isReadOnly= false;
                    });
                    },
                  ),
                ),
                if (!_isReadOnly) Container(
                  height: 25,
                  width: 30,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    color: Colors.red,
                  ),
                  child: IconButton(icon: Icon(Icons.save), iconSize: 20, alignment: Alignment.center, padding: EdgeInsets.only(top: 1),
                    onPressed: () {setState(() {
                      _isReadOnly= true;
                    });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: AutoDirection(
              text: text,
              child: TextField(
                readOnly: _isReadOnly,
                onChanged: (str){
                  setState(() {
                    text = str;
                  });
                },
                cursorColor: Colors.black,
                style: TextStyle(fontFamily: 'nazanin'),
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 20, top: 10),
            child: Row(
              children: <Widget>[
                Container(
                  height: 25,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    color: Colors.grey,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Importants'
                  ),
                ),
                Container(
                  height: 25,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    color: Colors.blue,
                  ),
                  child: IconButton(icon: Icon(Icons.add, color: Colors.black,), padding: EdgeInsets.all(0),
                    onPressed: (){
                    setState(() {
                      _creat('salam', true);
                    });
                    },
                  ),
                ),
              ],
            ),
          ),
          // importants.add(new important('salam', true));
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                // width: 100,
                height: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.vertical,
                  itemCount: importants.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      padding: EdgeInsets.only(bottom: 5),
                      height: 30,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: Colors.redAccent,
                            ),
                            child: IconButton(icon: Icon(Icons.delete, color: Colors.black,), padding: EdgeInsets.all(0), iconSize: 22,
                              onPressed: (){setState(() {
                                // print('salam: ');
                                // print(index);
                                importants.removeAt(index);
                              });},
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: importants[index].iconColor,
                            ),
                            child: IconButton(icon: Icon(importants[index].icon, color: Colors.black,), padding: EdgeInsets.all(0), iconSize: 20,
                              onPressed: () {setState(() {
                                if (importants[index].iconColor == Colors.blue){
                                  importants[index].iconColor = Colors.red;
                                  importants[index].icon = Icons.save;
                                  importants[index].readOnly = false;
                                }else{
                                  importants[index].iconColor = Colors.blue;
                                  importants[index].icon = Icons.edit;
                                  importants[index].readOnly = true;
                                }
                              });}
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 240,
                            child: TextField(
                              controller: importants[index].controller,
                              textDirection: ui.TextDirection.rtl,
                              readOnly: importants[index].readOnly,
                              style: TextStyle(
                                fontSize: 12
                              ),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder()
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: IconButton(icon: Icon(Icons.check_circle,color: importants[index].doneColor,), padding: EdgeInsets.all(0),
                              onPressed: (){setState(() {
                                if(importants[index].done){
                                  importants[index].done = false;
                                  importants[index].doneColor = Colors.white;
                                }else{
                                  importants[index].done = true;
                                  importants[index].doneColor = Colors.green;
                                }
                              });},
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 20, top: 10),
            child: Row(
              children: <Widget>[
                Container(
                  height: 25,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    color: Colors.grey,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'To-Do List',
                  ),
                ),
                Container(
                  height: 25,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    color: Colors.blue,
                  ),
                  child: IconButton(icon: Icon(Icons.add, color: Colors.black,), padding: EdgeInsets.all(0),
                    onPressed: (){setState(() {
                      _createTodoDay();
                    });},
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.vertical,
                itemCount: todoDays.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    padding: EdgeInsets.only(bottom: 5),
                    height: 65,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: Colors.redAccent,
                              ),
                              child: IconButton(icon: Icon(Icons.delete, color: Colors.black,), padding: EdgeInsets.all(0),
                                onPressed: (){setState(() {
                                  todoDays.removeAt(index);
                                });},
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: Colors.blue,
                              ),
                              child: IconButton(icon: Icon(Icons.edit, color: Colors.black,), padding: EdgeInsets.all(0),),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 240,
                              height: 25,
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.all(Radius.circular(5)),
                              //   border: Border.all(color: Colors.grey),
                              // ),
                              child: TextField(
                                // controller: todoDays[index].controller,
                                textDirection: ui.TextDirection.rtl,
                                readOnly: todoDays[index].readOnly,
                                style: TextStyle(
                                    fontSize: 12
                                ),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder()
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: IconButton(icon: Icon(Icons.check_circle,color: todoDays[index].doneColor,), padding: EdgeInsets.all(0),
                                onPressed: (){setState(() {
                                  if(todoDays[index].done){
                                    todoDays[index].done = false;
                                    todoDays[index].doneColor = Colors.white;
                                  }else{
                                    todoDays[index].done = true;
                                    todoDays[index].doneColor = Colors.green;
                                  }
                                });},
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 65,
                            ),
                            Container(
                              width: 60,
                              height: 25,
                              child: TextField(
                                maxLength: 3,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  counterText: "",
                                ),
                                keyboardType: TextInputType.number,
                                // inputFormatters: [],
                              ),
                            ),
                            SizedBox(
                              width: 85,
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              child: IconButton(icon: Icon(Icons.wb_sunny),padding: EdgeInsets.all(0),),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              child: IconButton(icon: Icon(Icons.wb_sunny), padding: EdgeInsets.all(0),),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              child: IconButton(icon: Icon(Icons.wb_sunny), padding: EdgeInsets.all(0),),
                            ),
                          ],
                        )
                      ],
                    )
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
