import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:talent_top_v0_1/utils/register_utils.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/newNumeroC.dart';

import 'newEmail.dart';
import 'newLastname.dart';
import 'newName.dart';
import 'newSemestre.dart';
import 'password.dart';

class ButtonNewUser extends StatefulWidget {
  @override
  _ButtonNewUserState createState() => _ButtonNewUserState();
}

class _ButtonNewUserState extends State<ButtonNewUser> {

  // static bool _enabled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 50, left: 200),
      child: Container(
        alignment: Alignment.bottomRight,
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
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: FlatButton(
          onPressed: /*_enabled ? */obtenerInfo/* : null*/,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.arrow_forward,
                size: 35,
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void obtenerInfo() {
    String nc = NewNC.nc;
    String semestre = NewSemestreState.newSemestre;
    String name = NewNomeState.newName;
    String lastName = NewLastnameState.newLastName;
    String email = NewEmail.newEmail.toLowerCase();
    String password = PasswordInputState.password;

    int resultado = validarInfo(nc, semestre, name, lastName, email, password);
    checkInputState(resultado);
  }

  void checkInputState(int resultado) {
    resultadoRegistro(resultado);
  }

  void resultadoRegistro(int resultado) {
    switch (resultado) {
      case 0:
        imprimirToast("Registrado con éxito");
        Navigator.pop(context);
        break;
      case 1:
        imprimirToast("Nombre inválido");
        break;
      case 2:
        imprimirToast("Apellido inválido");
        break;
      case 3:
        imprimirToast("Email inválido");
        break;
      default:
        imprimirToast("Error, por favor inténtelo más tarde");
        break;
    }
  }

  void imprimirToast(String msg) {
    Fluttertoast.showToast(msg: msg);
  }

}
