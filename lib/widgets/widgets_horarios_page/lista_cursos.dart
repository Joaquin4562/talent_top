import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListaCursos extends StatelessWidget {
  ValueListenable<List<String>> number;
  ListaCursos({this.number});
  List<String> cursos = [
    'Curso de ser guapo',
  ];
  Color colorFondo = Color.fromRGBO(255, 52, 68, 1);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: _mostrarCursos(context),
      ),
    );
  }

  List<Widget> _mostrarCursos(BuildContext context) {
    List<Widget> lista = new List();
    for (var item in cursos) {
      lista.add(ListTile(
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: colorFondo,
        ),
        leading: CircleAvatar(
          child: Text('jc'),
        ),
        title: Text(
          "$item",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        onTap: () {
          Navigator.of(context).pushReplacementNamed("HorariosPage");
        },
      ));
    }
    return lista;
  }
}
