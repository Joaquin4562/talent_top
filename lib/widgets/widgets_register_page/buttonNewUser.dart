import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:talent_top_v0_1/utils/register_utils.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/newEmail.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/newLastname.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/newName.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/newNumeroC.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/newSemestre.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/password.dart';


class ButtonNewUser extends StatefulWidget {

  ValueListenable<bool> enabled;

  ButtonNewUser(this.enabled);

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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
          ),
          onPressed: widget.enabled.value ? null : registrar,
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

  Future registrar() async {
    String nc = NewNC.nc;
    String semestre = NewSemestre.newSemestre;
    String name = NewNome.newName;
    String lastName = NewLastname.newLastName;
    String email = NewEmail.newEmail.toLowerCase();
    String password = PasswordInput.password;

    dynamic resultado = validarInfo(nc, semestre, name, lastName, email, password);
    resultadoRegistro(resultado);
  }

  Future resultadoRegistro(dynamic resultado) async {
    if (resultado == null) {
      imprimirToast("Error de conexión");
    } else {
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
        case 4:
          imprimirToast("Semestre inválido");
          break;
        case 5:
          imprimirToast("Contraseña inválida");
          break;
        case 6:
          imprimirToast("Llene todos los campos");
          break;
        case 7:
          imprimirToast('Error en el servidor, por favor inténtelo más tarde');
          break;
        default:
          revisarResultadoHTTP(resultado);
          break;
      }
    }
  }

  Future revisarResultadoHTTP(dynamic resultado) async {
    var res = (resultado as Future<String>).then((valor) {
      if (valor == 'exito') {
        resultadoRegistro(0);
      } else if (valor == 'error') {
        resultadoRegistro(4);
      }
    });
  }

  void imprimirToast(String msg) {
    Fluttertoast.showToast(msg: msg);
  }

}