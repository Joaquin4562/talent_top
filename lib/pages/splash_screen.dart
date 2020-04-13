import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:talent_top_v0_1/class/simple_animation_class.dart';

import 'package:talent_top_v0_1/pages/share_pref/preferencias_usuario.dart';
import 'package:talent_top_v0_1/utils/alumno_utils.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    var _duration = new Duration(seconds: 2);
    Timer(_duration, _cambiarPantalla);
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
            FadeAnimation(
                0.6,
                Container(
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

  _cambiarPantalla() async {
    if (prefs.sesion) {
      await _obtenerAlumno();
    } else {
      Navigator.of(context).pushReplacementNamed('LoginPage');
    }
  }

  Future _obtenerAlumno() {
    decodeInfoAlumno(prefs.matricula).then((value) {
      if (value == 'exito') {
        Navigator.of(context).pushReplacementNamed('IntermedioPage');
      } else {
        Fluttertoast.showToast(msg: 'Revisa tu conexión a internet');
        SystemNavigator.pop();
      }
    });
  }
}
