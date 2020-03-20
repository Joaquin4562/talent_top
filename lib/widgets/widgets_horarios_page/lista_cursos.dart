import 'package:flutter/material.dart';
import 'package:talent_top_v0_1/class/cursos.dart';
import 'package:talent_top_v0_1/class/simple_animation_class.dart';

class ListaCursos extends StatefulWidget {
  @override
  _ListaCursosState createState() => _ListaCursosState();
  List<Curso> cursos = new List();
  ListaCursos({this.cursos});
}

class _ListaCursosState extends State<ListaCursos> {
  Map<String, String> horas = {
    '07:00:00': '',
    '07:55:00': '',
    '08:50:00': '',
    '09:45:00': '',
    '10:40:00': '',
    '11:35:00': '',
    '12:30:00': '',
    '01:25:00': '',
    '02:20:00': '',
  };

  String curso = 'Hora libre para';
  Color colorFondo = Color.fromRGBO(255, 52, 68, 1);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: _mostrarHoras(context),
      ),
    );
  }

  List<Widget> _mostrarHoras(BuildContext context) {
    List<Widget> lista = new List();
    horas.forEach((hora, curso) {
      lista.add(FadeAnimation(
          1,
          ListTile(
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: colorFondo,
            ),
            leading: CircleAvatar(
              child: Text('H',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
                ),),
              backgroundColor: curso ==''? Colors.blueAccent:Colors.green,
              radius: 20,
            ),
            title: Text(
              "$hora",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: curso == ''
                ? Text(
                    'hora disponible',
                    style: TextStyle(fontSize: 17),
                  )
                : Text(
                    '$curso',
                    style: TextStyle(fontSize: 17),
                  ),
            onTap: () {
              showDialog(
                
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext context) => SimpleDialog(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        title: Text(
                          'Selecciona un curso\n$hora',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        children: _mostrarCursos(hora),
                      ));
            },
          )));
    });
    return lista;
  }

  List<Widget> _mostrarCursos(String hora) {
    bool encontro = false;
    List<Widget> lista = new List();
    for (var item in widget.cursos) {
      if (item.horaInicio == hora) {
        encontro = true;
        lista.add(FadeAnimation(
            0.5,
            ListTile(
              leading: CircleAvatar(
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/logo.png"),
                ),
              ),
              title: Text(
                "${item.nombre}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${item.autor}'),
              onTap: () {
                setState(() {
                  horas.update(
                    item.horaInicio,
                    (existingValue) => item.nombre,
                    ifAbsent: () => '',
                  );
                  Navigator.pop(context);
                });
              },
            )));
        lista.add(FadeAnimation(
            0.5,
            Divider(
              height: 2,
            )));
      }
    }
    if (!encontro) {
      lista.add(ListTile(
        title: Text(
          'No hay cursos disponibles esta hora',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        trailing: Icon(
          Icons.error,
          color: Colors.black,
        ),
      ));
    }
    return lista;
}
  
}
