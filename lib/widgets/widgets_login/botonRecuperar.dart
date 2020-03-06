import 'package:flutter/material.dart';

import '../../pages/newuser.page.dart';



class BtnRecuperar extends StatefulWidget {
  @override
  _BtnRecuperarState createState() => _BtnRecuperarState();
}

class _BtnRecuperarState extends State<BtnRecuperar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 50),
      child: Container(
        alignment: Alignment.topRight,
        //color: Colors.red,
        height: 20,
        child: Row(
          children: <Widget>[
            Text(
              '¿Olvidaste tu contraseña? ',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                Navigator.pushNamed(context, "RecuperacionPage");
              },
              child: Text(
                'Recuperar contraseña.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
