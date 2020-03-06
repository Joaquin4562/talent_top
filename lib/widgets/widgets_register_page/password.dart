import 'package:flutter/material.dart';

import 'package:talent_top_v0_1/utils/validations/password_validation.dart';

class PasswordInput extends StatefulWidget {
  @override
  PasswordInputState createState() => PasswordInputState();

}

class PasswordInputState extends State<PasswordInput> {

  static String _password = '';
  static String _ayudaPass = '';

  static String get password => _password;

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
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Icon(Icons.lock, color: Colors.white,),
            labelText: 'Contraseña',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
            helperText: _ayudaPass,
            helperStyle: TextStyle(color: Colors.red),
            counterText: '',
          ),
          onChanged: (text) {
            if (validarContrasena(text)) {
              _password = text;
            }
          },
          maxLines: 1,
          maxLength: 20,
        ),
      ),
    );
  }

  bool validarContrasena(String password) { 
    if (!validarLongContrasena(password)) {
      setState(() {
        _ayudaPass = 'Mínimo 8 caracteres';
      });
      return false;
    } else if (!validarMayusMinusNumsContrasena(password)) {
      setState(() {
        _ayudaPass = 'Mínimo 1 mayúscula, 1 minúscula y 1 número';
      });      
      return false;
    } else if (!validarFormatoContrasena(password)) {
      setState(() {
        _ayudaPass = 'Contraseña inválida';
      });
      return false;
    } else {
      setState(() {
        _ayudaPass = '';
      });
      return true;
    }
  }
}