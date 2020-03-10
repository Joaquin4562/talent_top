import 'package:flutter/material.dart';
import 'package:talent_top_v0_1/widgets/widgets_horarios_page/lista_cursos.dart';

class BotonAgregar extends StatefulWidget {
  BotonAgregar({Key key}) : super(key: key);

  @override
  _BotonAgregarState createState() => _BotonAgregarState();
}

class _BotonAgregarState extends State<BotonAgregar> {

  Color colorFondo = Color.fromRGBO(255, 52, 68, 1);
  //cursos disponibles segun el dia y hora
  List<String> cursos = [
    'Curso de ser guapo',
    'Curso de chapulinear',
    'Curso de JS',
    'Curso de Flutter',
    'Curso de hacking',
    'Curso de Perreo',
    'Curso de robotica'
  ];
  String _cursoSeleccionado = "";
  @override
  Widget build(BuildContext context) {
    return FlatButton(
            onPressed: () {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext context) => SimpleDialog(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        title: Text(
                          'Selecciona un curso',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        children: _mostrarCursos(),
                      ));
            },
            child: ListTile(
              title: Text('Agregar curso'),
              leading: CircleAvatar(
                child: Icon(Icons.add),
              ),
            ),
          );

  }

  List<Widget> _mostrarCursos() {
    List<Widget> lista = new List();
    for (var item in cursos) {
      lista.add(ListTile(
        leading: Icon(
          Icons.calendar_today,
          color: Colors.black,
        ),
        title: Text(
          "$item",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        onTap: () {
          
        },
      ));
    }
    return lista;
  }
}
