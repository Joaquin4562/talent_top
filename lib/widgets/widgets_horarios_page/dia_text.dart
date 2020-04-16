import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talent_top_v0_1/providers/cursos.dart';

class DiaText extends StatefulWidget {
  @override
  _DiaTextState createState() => _DiaTextState();
}

class _DiaTextState extends State<DiaText> {
  @override
  Widget build(BuildContext context) {

    Cursos cursos = Provider.of<Cursos>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 30),
      child: Text( cursos.dia,
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
          fontFamily: 'Oswaldo'
        ),
      ),
    );
  }
}
