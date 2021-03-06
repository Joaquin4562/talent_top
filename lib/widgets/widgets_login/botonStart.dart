import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:talent_top_v0_1/utils/alumno_utils.dart';
import 'package:talent_top_v0_1/utils/login_utils.dart';

import 'package:talent_top_v0_1/widgets/widgets_login/txtEmail.dart';
import 'package:talent_top_v0_1/widgets/widgets_login/txtPassword.dart';

import 'package:talent_top_v0_1/pages/share_pref/preferencias_usuario.dart';

class BotonStart extends StatefulWidget {
  @override
  _ButtonLoginState createState() => _ButtonLoginState();
  double height;
  BotonStart(this.height);
}

class _ButtonLoginState extends State<BotonStart> {
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 50,left: 200),
      child: Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        width: widget.height<600 ? MediaQuery.of(context).size.width-240:MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blue[300],
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 1.0, // has the effect of extending the shadow
              offset: Offset(
                5.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onPressed: login,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.arrow_forward,
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> login() async {
    try {
      obtenerInfo(InputEmailState.getMatricula.toString(),
              TxtPassword.getPassword.toString())
          .then((valor) {
        if (valor == 'alumno logeado') {
          decodeInfoAlumno(InputEmailState.getMatricula.toString())
              .then((value) {
            if (value == 'exito') {
              prefs.matricula = InputEmailState.getMatricula.toString();
              prefs.sesion = true;
              Navigator.of(context).pushReplacementNamed('IntermedioPage');
            } else {
              Fluttertoast.showToast(msg: 'Error de conexión');
            }
          });
        } else {
          Fluttertoast.showToast(msg: 'Contraseña o matrícula incorrectas');
        }
      });
    } catch (Exception) {
      Fluttertoast.showToast(msg: 'Error de conexión');
    }
  }
}
