import 'package:flutter/material.dart';

class TxtEmail extends StatefulWidget {
  @override
  InputEmailState createState() => InputEmailState();
}

class InputEmailState extends State<TxtEmail> {

   static String _matricula = '';
   static String get getMatricula => _matricula;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.lightBlueAccent,
            suffixIcon: Icon(Icons.people, color: Colors.white,),
            labelText: 'Matricula',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
            
          ),
          onChanged: (text){
            _matricula = text;
          }
        ),
      ),
    );
  }
}