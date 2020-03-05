import 'package:flutter/material.dart';

class NewLastname extends StatefulWidget {
  @override
  NewLastnameState createState() => NewLastnameState();
}

class NewLastnameState extends State<NewLastname> {

  static String _newLastName = '';

  static String get newLastName => _newLastName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Icon(Icons.text_format, color: Colors.white,),
            fillColor: Colors.lightBlueAccent,
            labelText: 'Apellidos',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
          onChanged: (text) {
            _newLastName = text;
          },
        ),
      ),
    );
  }
  }