import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talent_top_v0_1/class/alumno.dart';
import 'package:talent_top_v0_1/utils/recuperar_contrasena_utils.dart';
import 'package:talent_top_v0_1/widgets/widgets_recuperar_page/input_numero_control.dart';
import 'dart:convert';

class BotonRecuperar extends StatefulWidget {
  @override
  _BotonRecuperarState createState() => _BotonRecuperarState();
}

class _BotonRecuperarState extends State<BotonRecuperar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 40, left: 200),
      child: Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blue[300],
              blurRadius: 6.0, // has the effect of softening the shadow
              spreadRadius: 0.0, // has the effect of extending the shadow
              offset: Offset(
                1.0, // horizontal, move right 10
                1.0, // vertical, move down 10
              ),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FlatButton(
          onPressed: recuperarPassword,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.arrow_forward,
                size: 30,
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> recuperarPassword() async{
      sendEmail(InputNumeroControlState.getMatricula.toString())
      .then((response){
        Map<String, dynamic> user = jsonDecode(response);
        //No existe cuenta | Ha ocurrido un error | Enviado con exito
        Fluttertoast.showToast(msg: '${user['result']}');
        Navigator.pop(context);
      });
  }

}
