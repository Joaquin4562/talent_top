import 'package:flutter/material.dart';

class NewSemestre extends StatefulWidget {
  @override
  _NewSemestreState createState() => _NewSemestreState();
}

class _NewSemestreState extends State<NewSemestre> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 1,),
      child: Container(
        height: 60,
        width: 120,
        child: TextField(
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.lightBlueAccent,
            labelText: 'Semestre',
            suffixIcon: Icon(Icons.people,color: Colors.white,),
            // prefixIcon: Icon(Icons.perm_contact_calendar,color: Colors.white,),
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}