import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:talent_top_v0_1/utils/nc_utils.dart';
import 'package:talent_top_v0_1/utils/validations/nc_validations.dart';

class NewNC extends StatefulWidget {

  ValueNotifier<bool> enabled;

  NewNC(this.enabled);

  @override
  _NewNCState createState() => _NewNCState();

  static String get nc => _NewNCState._nc;

}

class _NewNCState extends State<NewNC> {

  static String _ayudaNC = '';
  static String _nc = '';
  static bool _enableButton = false;

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
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: _enableButton ? matricula : null,
                color: Colors.transparent,
              ),
              fillColor: Colors.lightBlueAccent,
              labelText: 'Matrícula',
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
      widget.enabled.value = false;
      if (valor == 'matricula encontrada') {
        imprimirToast('Ahora puede registrarse.');
      } else {
        imprimirToast('Matrícula no encontrada');
      }
      return null;
    }); 
  }

  void imprimirToast(String msg) {
    Fluttertoast.showToast(msg: msg);
  }

}