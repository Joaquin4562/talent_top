import 'package:flutter/material.dart';

class HeaderTextRecuperar extends StatefulWidget {
  @override
  _HeaderTextRecuperarState createState() => _HeaderTextRecuperarState();
}

class _HeaderTextRecuperarState extends State<HeaderTextRecuperar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20),
      child: RotatedBox(
          quarterTurns: 0,
          child: Text(
            'Recuperar contraseña',
            style: TextStyle(
              letterSpacing: 5,
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          )),
    );
  }
}
