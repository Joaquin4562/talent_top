import 'package:flutter/material.dart';

class TxtPassword extends StatefulWidget {
  @override
  PasswordInputState createState() => PasswordInputState();
}

class PasswordInputState extends State<TxtPassword> {

  static String _password = '';
  static String get getPassword => _password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          style: TextStyle(
            color: Colors.white,
          ),
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Icon(Icons.vpn_key, color: Colors.white,),
            labelText: 'Contraseña',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
          onChanged: (text){
            _password = text;
          }
        ),
      ),
    );
  }
}