import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talent_top_v0_1/class/simple_animation_class.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var _duration =  new  Duration (seconds :  2 );
    Timer (_duration, _cambiarPantalla);
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeAnimation(0.6,Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'))),
            )),
            SizedBox(
              height: 30,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 8.0,
            ),
          ],
        ),
      ),
    );
  }

  void _cambiarPantalla() {
    Navigator.of(context).pushReplacementNamed('LoginPage');
  }
}
