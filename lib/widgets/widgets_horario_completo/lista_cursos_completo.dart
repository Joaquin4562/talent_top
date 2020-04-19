import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:talent_top_v0_1/class/curso.dart';

import 'package:talent_top_v0_1/providers/cursos.dart';
import 'package:talent_top_v0_1/providers/lunes.dart';
import 'package:talent_top_v0_1/providers/martes.dart';
import 'package:talent_top_v0_1/providers/miercoles.dart';
import 'package:talent_top_v0_1/providers/jueves.dart';

import 'package:talent_top_v0_1/class/simple_animation_class.dart';

class ListaCursosCompleto extends StatefulWidget {

  @override
  _ListaCursosCompletoState createState() => _ListaCursosCompletoState();
}

class _ListaCursosCompletoState extends State<ListaCursosCompleto> {

  bool _encontro = false;
  Color colorFondo = Color.fromRGBO(255, 52, 68, 1);
  dynamic horario;
  Cursos cursos;

  @override
  Widget build(BuildContext context) {
    cursos = Provider.of<Cursos>(context);
    horario = _obtenerCursoDia(cursos.dia);
    return Expanded(
      child: ListView(
        children: _mostrarHoras(context),
      ),
    );
  }

  List<Widget> _mostrarHoras(BuildContext context) {
    List<Widget> lista = new List();
    horario.horas.forEach((hora, curso) {
      lista.add(FadeAnimation( 1,
        ListTile(
          trailing: Icon(
            curso == null ? Icons.person_add : Icons.person,
            color: curso == null ? Colors.blue : Colors.green,
            size: 30,
          ),
          leading: CircleAvatar(
            child: Text( 'H',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: curso == null ? Colors.blueAccent : Colors.green,
            radius: 20,
          ),
          title: Text( "$hora",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          subtitle: curso == null
            ? Text(
              'hora disponible',
              style: TextStyle(fontSize: 17),
            )
            : Text(
              '${curso.nombreCurso}',
              style: TextStyle(fontSize: 17),
            ),
          onTap: () {
          },
        )
      ));
    });
    return lista;
  }


  dynamic _obtenerCursoDia(String dia) {
    switch(dia) {
      case 'Lunes'      : return Provider.of<Lunes>(context);
      case 'Martes'     : return Provider.of<Martes>(context);
      case 'Miercoles'  : return Provider.of<Miercoles>(context);
      case 'Miércoles'  : return Provider.of<Miercoles>(context);
      case 'Jueves'     : return Provider.of<Jueves>(context);
    }
  }
}
