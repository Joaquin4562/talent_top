import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class NewEmail extends StatefulWidget {

  ValueListenable<bool> enabled;

  @override
  _NewEmailState createState() => _NewEmailState();

  static String get newEmail => _NewEmailState._newEmail;
  
  NewEmail(this.enabled);

}

class _NewEmailState extends State<NewEmail> {

  static String _newEmail = '';
  
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
            suffixIcon: Icon(Icons.alternate_email,color: Colors.white,),
            fillColor: Colors.lightBlueAccent,
            labelText: 'Correo institucional',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
          onChanged: (text) {
            _newEmail = text;
          },
        ),
      ),
    );
  }

}