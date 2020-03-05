import 'package:flutter/material.dart';

class NewLogo extends StatefulWidget {
  @override
  _NewLogoState createState() => _NewLogoState();
}

class _NewLogoState extends State<NewLogo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0, left: 10.0),
      child: Container(
        //color: Colors.green,
        height: 200,
        width: 200,
        child: Column(
          children: <Widget>[
            Container(
              height: 20,
            ),
            Center(
              child: Image(
                image: AssetImage("assets/images/logo.png"),
              )
            ),
          ],
        ),
      ),
    );
  }
}