import 'package:flutter/material.dart';

class NewEmail extends StatefulWidget {
  bool enable;
  @override
  _NewEmailState createState() => _NewEmailState();
  static String get newEmail => _NewEmailState._newEmail;
  NewEmail({this.enable});
  bool get on => enable;
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