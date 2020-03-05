import 'package:flutter/material.dart';

class NewEmail extends StatefulWidget {
  @override
  NewEmailState createState() => NewEmailState();
}

class NewEmailState extends State<NewEmail> {

  static String _newEmail = '';

  static String get newEmail => _newEmail;

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
            suffixIcon: Icon(Icons.alternate_email,color: Colors.white,),
            fillColor: Colors.lightBlueAccent,
            labelText: 'E-mail',
            labelStyle: TextStyle(
              color: Colors.white,
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