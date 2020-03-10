import 'package:flutter/material.dart';

class TxtPassword extends StatefulWidget {
  @override
  _PasswordInputState createState() => _PasswordInputState();
    static String get getPassword => _PasswordInputState._password;

}

class _PasswordInputState extends State<TxtPassword> {

  static String _password = '';
  bool _obscureText=true;
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
          obscureText: _obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: GestureDetector(
              onTap: (){
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: (_obscureText ? _iconOn() : _iconOff()),
            ),
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

 Widget _iconOn() {
   return Icon(Icons.visibility,color: Colors.white,);
 }
 Widget _iconOff() {
   return Icon(Icons.visibility_off,color: Colors.white,);
 }
}