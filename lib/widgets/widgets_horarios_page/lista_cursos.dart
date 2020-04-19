import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:talent_top_v0_1/class/curso.dart';

import 'package:talent_top_v0_1/providers/cursos.dart';
import 'package:talent_top_v0_1/providers/lunes.dart';
import 'package:talent_top_v0_1/providers/martes.dart';
import 'package:talent_top_v0_1/providers/miercoles.dart';
import 'package:talent_top_v0_1/providers/jueves.dart';

import 'package:talent_top_v0_1/utils/agregar_curso_utils.dart';

import 'package:talent_top_v0_1/class/alumno.dart';
import 'package:talent_top_v0_1/class/simple_animation_class.dart';

class ListaCursos extends StatefulWidget {

  @override
  _ListaCursosState createState() => _ListaCursosState();
}

class _ListaCursosState extends State<ListaCursos> {

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
            showDialog(
              barrierDismissible: true,
              context: context,
              builder: (BuildContext context) => SimpleDialog(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                title: Text(
                  'Selecciona un curso\n$hora',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                children: _mostrarCursos(hora),
              )
            );
          },
        )
      ));
    });
    return lista;
  }

  List<Widget> _mostrarCursos(String hora) {
    bool encontro = false;
    List<Widget> lista = new List();
    try {
      for (Curso curso in cursos.cursos) {
        if (curso.horaInicio == hora) {
          encontro = true;
          lista.add(FadeAnimation( 0.5,
            ListTile(
              leading: CircleAvatar(
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/logo.png"),
                ),
              ),
              title: Text( "${curso.nombreCurso}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text('Autor: ${curso.responsable}\nLugar: ${curso.lugar}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
              onTap: () {
                String idCursoAnterior;
                String cambio;
                for (var key in horario.horas.keys.toList()) {
                  if (key == curso.horaInicio) {
                    if (horario.horas[key] == null) {
                      idCursoAnterior = '-1';
                      cambio = '0';
                    } else {
                      idCursoAnterior = horario.horas[key].idCurso;
                      cambio = '1';
                    }
                  }
                }
                agregarCurso(Alumno.idAlumno, curso.idCurso, idCursoAnterior, cambio).then((value){
                  if (value == 'exito') {
                    _agregarCadena(curso.mismoCurso, curso.idCurso);
                    setState(() {
                      for (var key in horario.horas.keys.toList()) {
                        if (key == curso.horaInicio)
                          _encontro = true;
                        if (key == curso.horaFin)
                          _encontro = false;
                        if (_encontro) {
                          horario.horas.update(key, (valorExistente) { 
                            return curso;
                          },
                          ifAbsent: () => null);
                        }
                      }
                      _encontro = false;
                      Navigator.pop(context);
                    });
                  } else {
                    Fluttertoast.showToast(msg: 'Revisa tu conexión a internet');
                  }
                });
              },
            )
          ));
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Cargando datos...');
    }
    if (!encontro) {
      lista.add(ListTile(
        title: Text( 'No hay cursos disponibles esta hora',
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

  dynamic _obtenerCursoDia(String dia) {
    switch(dia) {
      case 'Lunes'      : return Provider.of<Lunes>(context);
      case 'Martes'     : return Provider.of<Martes>(context);
      case 'Miercoles'  : return Provider.of<Miercoles>(context);
      case 'Miércoles'  : return Provider.of<Miercoles>(context);
      case 'Jueves'     : return Provider.of<Jueves>(context);
    }
  }

  _agregarCadena(String mismoCurso, String idCurso) async {
    
    for (Curso curso in cursos.todosCursos) {
      if (curso.mismoCurso == mismoCurso && curso.idCurso != idCurso) {
        String idCursoAnterior;
        String cambio;
        dynamic horarioDia = _obtenerCursoDia(curso.dia);
        Map<String, Curso> horarioActualizar = horarioDia.horas;
        if (horarioActualizar[curso.horaInicio] == null) {
          idCursoAnterior = '-1';
          cambio = '0';
        } else {
          idCursoAnterior = horarioActualizar[curso.horaInicio].idCurso;
          cambio = '1';
        }
        agregarCurso(Alumno.idAlumno, curso.idCurso, idCursoAnterior, cambio).then((value) {
          if (value == 'exito') {
            for (var key in horarioActualizar.keys.toList()) {
              if (key == curso.horaInicio)
                _encontro = true;
              if (key == curso.horaFin)
                _encontro = false;
              if (_encontro) {
                horarioActualizar.update(key, (valorExistente) { 
                  return curso;
                },
                ifAbsent: () => null);
              }
            }
            _encontro = false;
          } else {
            Fluttertoast.showToast(msg: 'Revisa tu conexión a internet');
          }
        });
      }
    }
  }

}
