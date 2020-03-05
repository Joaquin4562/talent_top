import 'package:flutter/material.dart';

class NewNC extends StatefulWidget {
  @override
  NewNCState createState() => NewNCState();
}

class NewNCState extends State<NewNC> {

  static String _nc = '';

  static String get nc {
    return _nc;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50,),
      child: Container(
        height: 60,
        width: 220,
        child: TextField(
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
            },
            color: Colors.white,
            iconSize: 30,
            ),
            fillColor: Colors.lightBlueAccent,
            labelText: 'Numero de control',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
          onChanged: (text) {
            _nc = text;
          },
        ),
      ),
    );
  }
