import 'package:flutter/material.dart';

class NewNome extends StatefulWidget {
  @override
  NewNomeState createState() => NewNomeState();
}

class NewNomeState extends State<NewNome> {

  static String _newName = '';
  
  static String get newName => _newName;

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
            labelText: 'Nombre',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
          onChanged: (text) {
            _newName = text;
          },
        ),
      ),
    );
  }
}