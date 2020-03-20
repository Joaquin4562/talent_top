import 'package:flutter/material.dart';

class UserOld extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30),
      child: Container(
        alignment: Alignment.topRight,
        height: 20,
        child: Row(
          children: <Widget>[
            Text(
              '¿Ya tienes una cuenta?',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white70,
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('LoginPage');
              },
              child: Text(
                'Inicia sesión',
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