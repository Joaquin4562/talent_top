import 'package:flutter/material.dart';

import 'package:talent_top_v0_1/class/simple_animation_class.dart';

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
    'Curso de robotica',
    'Curso de Flutter',
    'Curso de hacking',
    'Curso de Perreo',
    'Curso de Flutter',
    'Curso de hacking',
    'Curso de Perreo',
  ];
  @override
  Widget build(BuildContext context) {
    return FlatButton(
            onPressed: () {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext context) => SimpleDialog(
                        semanticLabel: 'hola',
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
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
      lista.add(
        FadeAnimation(1,ListTile(
        leading: CircleAvatar(
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/logo.png"),
          ),
        ),
        title: Text(
          "$item",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
            ),
        ),
        subtitle: Text('Angel Eddy Catedral gonzalez'),
        onTap: () {
          
        },
      )));
      lista.add(Divider(height: 2,));
    }
    return lista;
  }
}
