import 'package:flutter/material.dart';

class BtnRegister extends StatefulWidget {
  @override
  _FirstTimeState createState() => _FirstTimeState();
  double height;
  BtnRegister(double height){
    this.height=height;
  }
}

class _FirstTimeState extends State<BtnRegister> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30),
      child: Container(
        alignment: Alignment.topRight,
        //color: Colors.red,
        height: 20,
        child: Row(
          children: <Widget>[
            Text(
              '¿No tienes una cuenta aún?   ',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                Navigator.pushNamed(context, 'RegisterPage');
              },
              child: Text(
                'Registrate ahora.',
                style: TextStyle(
                  fontSize: widget.height < 600 ? 15:12,
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
