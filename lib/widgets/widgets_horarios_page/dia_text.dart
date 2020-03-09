import 'package:flutter/material.dart';

import 'boton_elige_dia.dart';

class DiaText extends StatefulWidget {
  DiaText({Key key}) : super(key: key);

  @override
  _DiaTextState createState() => _DiaTextState();
}

class _DiaTextState extends State<DiaText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 30),
      child: Text(
        BotonElige.dia,
        style: TextStyle(
            fontSize: 25,
            shadows: [
              BoxShadow(
                blurRadius: 5.0,
                color: Colors.black26,
              )
            ],
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
            letterSpacing: 2,
            fontFamily: 'Oswaldo'),
      ),
    );
  }
}
