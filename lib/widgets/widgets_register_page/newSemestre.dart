import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class NewSemestre extends StatefulWidget {

  ValueListenable<bool> enabled;

  @override
  _NewSemestreState createState() => _NewSemestreState();

  NewSemestre(this.enabled);

  static String get newSemestre => _NewSemestreState._newSemestre;

}

class _NewSemestreState extends State<NewSemestre> {

  static String _newSemestre = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 1,),
      child: Container(
        height: 77,
        width: 120,
        child: TextField(
          readOnly: widget.enabled.value,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.lightBlueAccent,
            labelText: 'Semestre',
            suffixIcon: Icon(Icons.people,color: Colors.white,),
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
          onChanged: (text){
            _newSemestre = text;
          },
        ),
      ),
    );
  }
  
}