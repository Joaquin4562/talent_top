import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

class NewLastname extends StatefulWidget {

  ValueListenable<bool> enabled;

  @override
  _NewLastnameState createState() => _NewLastnameState();

  NewLastname(this.enabled);

  static String get newLastName => _NewLastnameState._newLastName;
  
}

class _NewLastnameState extends State<NewLastname> {

  static String _newLastName = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          readOnly: widget.enabled.value,
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