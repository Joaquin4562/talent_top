import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:talent_top_v0_1/class/toast_class.dart';
import 'package:talent_top_v0_1/utils/nc_utils.dart';

import 'package:talent_top_v0_1/utils/validations/nc_validations.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/newEmail.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/newLastname.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/newName.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/newSemestre.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/password.dart';

class NewNC extends StatefulWidget {
  @override
  NewNCState createState() => NewNCState();
}

class NewNCState extends State<NewNC> {

  static String _ayudaNC = '';
  static String _nc = '';
  static bool _enableButton = false;

  static String get nc => _nc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50,),
      child: Container(
        height: 77,
        width: 220,
          child: TextField(
            maxLength: 9,
            maxLines: 1,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              counterText: '',
              helperText: _ayudaNC,
              helperStyle: TextStyle(color: Colors.red),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: _enableButton ? matricula : null,
                color: Colors.white,
                iconSize: 30,
              ),
              fillColor: Colors.lightBlueAccent,
              labelText: 'Número de control',
              labelStyle: TextStyle(
                color: Colors.white70,
              ),
            ),
          onChanged: (text) {
            if (validarNC(text)) {
              _nc = text;
            }
          },
        ),
      ),
    );
  }

  bool validarNC(String nc) {
    if (validarLongNC(nc) && validarFormatoNC(nc)) {
      setState(() {
        _ayudaNC = '';
        _enableButton = true;
      });
      return true;
    } else {
      setState(() {
        _ayudaNC = 'Número de control inválido';
        _enableButton = false;
      });
      return false;
    }
  }
  
  Future matricula() async {
    Future<String> respuesta = buscarMatricula(_nc).then((valor) {
      if (valor == 'matricula encontrada') {
        NewSemestreState.activar();
        NewNomeState.activar();
        NewLastnameState.activar();
        NewEmailState.activar();
        PasswordInputState.activar();
        
        imprimirToast('Ahora puede registrarse.');
      }
      return null;
    }); 
  }

  void imprimirToast(String msg) {
    showToastWidget(
      ToastClass(icon: Icons.error_outline,text: msg,),
      duration: Duration(seconds: 2),
      curve: Curves.easeOutBack,
      textDirection: TextDirection.ltr,
      alignment: Alignment.center,
      context: context,
      position: StyledToastPosition.bottom,
      animation: StyledToastAnimation.fadeScale
    );
  }

}