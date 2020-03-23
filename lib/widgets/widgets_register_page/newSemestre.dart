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

  static const menuItems =<String>[
    '2',
    '4',
    '6',
    '8'
  ];

  final List<DropdownMenuItem<String>> _dropMenuItems = menuItems.map(
    (String value)=>DropdownMenuItem<String>(
      value: value,
      child: Text(value,
      style: TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),),
    ),
  ).toList();

  @override
  void dispose() { 
    _newSemestre = '';
    super.dispose();
  }

  static String _newSemestre = '';
  String _selectedVal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 1,),
      child: Container(
        height: 77,
        width: 120,
        child: DropdownButton(
          underline: Text(''),
          icon: Icon(Icons.arrow_drop_down,color:Colors.white),
          items: _dropMenuItems,
          style: TextStyle(color: Colors.white),
          onChanged: widget.enabled.value ? null:(String value){
            setState(() {
              _selectedVal=value;
              _newSemestre =value;
            });
          },
          value: _selectedVal,
          hint: Text('Semestre', 
            style: TextStyle(color:Colors.white,fontSize: 16),
          ),
        ),
      ),
    );
  }
  
}