import 'package:flutter/material.dart';

class InputNumeroControl extends StatefulWidget {
  @override
  InputNumeroControlState createState() => InputNumeroControlState();
}

class InputNumeroControlState extends State<InputNumeroControl> {

   static String _nc = '';
   static void set setMatricula(String matricula){
     _nc = matricula;
   }
   static String get getMatricula => _nc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 50,
      ),
      child: Container(
        height: 60,
        width: 220,
        child: TextField(
          autofocus: false,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: Colors.white,
              iconSize: 30,
            ),
            fillColor: Colors.lightBlueAccent,
            labelText: 'Numero de control',
            labelStyle: TextStyle(
              fontSize: 20,
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
}
