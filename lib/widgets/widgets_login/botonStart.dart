import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talent_top_v0_1/utils/login_utils.dart';
import 'package:talent_top_v0_1/widgets/widgets_login/txtEmail.dart';
import 'package:talent_top_v0_1/widgets/widgets_login/txtPassword.dart';


class BotonStart extends StatefulWidget {
  @override
  _ButtonLoginState createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<BotonStart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 50, left: 250),
      child: Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        width: MediaQuery.of(context).size.width,
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
  Future<String> login() async{
    obtenerInfo(InputEmailState.getMatricula.toString(), PasswordInputState.getPassword.toString()).then((valor){
      if(valor == 'alumno logeado'){
        Navigator.of(context).pushReplacementNamed('HorariosPage');
      }else{
        Fluttertoast.showToast(msg: 'Contaseña o matrícula incorrectas');
      }
    });
  }
}


