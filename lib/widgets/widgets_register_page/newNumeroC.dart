import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talent_top_v0_1/pages/horarios_page.dart';
import 'package:talent_top_v0_1/pages/newuser.page.dart';

import 'package:talent_top_v0_1/utils/nc_utils.dart';
import 'package:talent_top_v0_1/utils/validations/nc_validations.dart';

class NewNC extends StatefulWidget {
  @override
  _NewNCState createState() => _NewNCState();
    static String get nc => _NewNCState._nc;
  static bool get validacion=>_NewNCState._validador;
}

class _NewNCState extends State<NewNC> {

  static String _ayudaNC = '';
  static String _nc = '';
  static bool _enableButton = false;

  static bool _validador=false;

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
              suffixIcon: FlatButton(
                child: Icon(Icons.search,color: Colors.white),
                onPressed: (){
                   NewUser().createState().enableOn();
                },
                // onPressed: _enableButton ? matricula : null,
                color: Colors.transparent,
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
        imprimirToast('Ahora puede registrarse.');
      }
      return null;
    }); 
  }

  void imprimirToast(String msg) {
    Fluttertoast.showToast(msg: msg);
  }

}