import 'package:flutter/material.dart';

class TxtRegistrate extends StatefulWidget {
  @override
  _TxtRegistrateState createState() => _TxtRegistrateState();
}

class _TxtRegistrateState extends State<TxtRegistrate> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30,),
      child: RotatedBox(
          quarterTurns: 0,
          child: Text(
            'Registrate',
            style: TextStyle(
              letterSpacing: 7,
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.w900,
            ),
          )),
    );
  }
}
