import 'package:flutter/material.dart';

class ListaCursos extends StatefulWidget {
  ListaCursos({Key key}) : super(key: key);

  @override
  _ListaCursosState createState() => _ListaCursosState();
}

class _ListaCursosState extends State<ListaCursos> {
  List<String> cursos = [
    'Curso de ser guapo',
    'Curso de chapulinear',
    'Curso de JS',
    'Curso de Flutter',
    'Curso de hacking',
    'Curso de Perreo',
    'Curso de robotica'
  ];
    Color colorFondo = Color.fromRGBO(255, 52, 68, 1);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: cursos.length,
        padding: EdgeInsets.all(10),
        itemBuilder: (BuildContext context, int i) {
          return _buildCurso(cursos[i]);
        },
      ),
    );
  }

  Widget _buildCurso(String curso) {
    return Column(
      children: <Widget>[
        ListTile(
            onTap: () {},
            leading: CircleAvatar(
              child: Text('JC'),
            ),
            title: Text(
              curso,
            ),
            subtitle: Text('CC2'),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: colorFondo,
            )),
        Divider()
      ],
    );
  }
}
