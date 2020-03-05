import 'package:flutter/material.dart';

class HeaderText extends StatefulWidget {
  @override
  _VerticalTextState createState() => _VerticalTextState();
}

class _VerticalTextState extends State<HeaderText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 20),
      child: RotatedBox(
          quarterTurns: 0,
          child: Text(
            'Iniciar sesión',
            style: TextStyle(
              letterSpacing: 2,
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.w900,
            ),
          )),
    );
  }
}
