import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class NewNome extends StatefulWidget {

  ValueListenable<bool> enabled;

  @override
  _NewNomeState createState() => _NewNomeState();

  NewNome(this.enabled);

  static String get newName => _NewNomeState._newName;

}

class _NewNomeState extends State<NewNome> {

  static String _newName = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          textCapitalization: TextCapitalization.words,
          readOnly: widget.enabled.value,
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