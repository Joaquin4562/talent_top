import 'dart:async';

import 'package:flutter/material.dart';

import 'login.page.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),()=>_cambiarPantalla());
  }
  @override
  void dispose() {
    super.dispose();
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blueAccent,Colors.lightBlueAccent])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png')
                )
              ),
            ),
            SizedBox(height: 30,),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 8.0,
              semanticsLabel: 'Cargando',
              semanticsValue: 'Cargando',
              ),
          ],
        ),
      ),
    );
  }

void _cambiarPantalla() {
     Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));              
  }
}