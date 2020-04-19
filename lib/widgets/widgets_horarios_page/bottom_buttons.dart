import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:talent_top_v0_1/class/alumno.dart';
import 'package:talent_top_v0_1/class/curso.dart';
import 'package:talent_top_v0_1/providers/cursos.dart';
import 'package:talent_top_v0_1/providers/jueves.dart';
import 'package:talent_top_v0_1/providers/lunes.dart';
import 'package:talent_top_v0_1/providers/martes.dart';
import 'package:talent_top_v0_1/providers/miercoles.dart';
import 'package:talent_top_v0_1/utils/confirma_horario_utils.dart';
import 'package:talent_top_v0_1/utils/eliminar_curso_utils.dart';

class BottomButtons extends StatefulWidget {

  @override
  _BottomButtonsState createState() => _BottomButtonsState();

}

class _BottomButtonsState extends State<BottomButtons> {

  Color colorFondo = Color.fromRGBO(255, 52, 68, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text( '¿Terminaste?',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Oswaldo',
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: 120,
            decoration: BoxDecoration(color: Colors.transparent),
            child: InkWell(
              child: OutlineButton(
                splashColor: Colors.blueAccent,
                highlightedBorderColor: colorFondo,                
                borderSide: BorderSide(
                  color: colorFondo, 
                  style: BorderStyle.solid, width: 4
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onPressed: () {
                  _showLoadDialog();
                  _borrarCursos();
                },
                child: Text( 'Limpiar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              ),
            ),
          ),
          Container(
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), 
              color: colorFondo
            ),
            child: InkWell(
              child: FlatButton(
                onPressed: () {
                  // TODO: AGREGAR FUNCIÓN PARA VERIFICAR HORARIO LLENO
                  _confirmarCursos();
                },
                child: Text( 'Confirmar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              ),
            ),
          )
        ],
      ),
    );
  }

  _showLoadDialog() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text( 'Borrando sus cursos...',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20,),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                backgroundColor: Colors.red,
                strokeWidth: 8.0,
              ),
            ],
          ),
        ]
      )
    );
  }

  _borrarCursos() async {
    Lunes cursosLunes = Provider.of<Lunes>(context);
    Martes cursosMartes = Provider.of<Martes>(context);
    Miercoles cursosMiercoles = Provider.of<Miercoles>(context);
    Jueves cursosJueves = Provider.of<Jueves>(context);
    Cursos cursos = Provider.of<Cursos>(context);
    await _borrarCursosLunes(cursosLunes);
    await _borrarCursosMartes(cursosMartes);
    await _borrarCursosMiercoles(cursosMiercoles);
    await _borrarCursosJueves(cursosJueves);
    Fluttertoast.showToast(msg: 'Se han borrado todos los cursos');
    cursos.dia = 'Lunes';
    Navigator.pushReplacementNamed(context, 'HorariosPage');
  }

  _borrarCursosLunes(Lunes cursosLunes) async {
    for (var key in cursosLunes.horas.keys.toList()) {
      if (cursosLunes.horas[key] != null) {
        await borrarCurso(Alumno.idAlumno, cursosLunes.horas[key].idCurso).then((value){
          if (value == 'exito') {
            cursosLunes.horas.update(key, (curso) => null, ifAbsent: () => null);
          } else {
            Fluttertoast.showToast(msg: 'Revisa tu conexión a internet');
            return;
          }
        });
      }
    }
  }

  _borrarCursosMartes(Martes cursosMartes) async {
    for (var key in cursosMartes.horas.keys.toList()) {
      if (cursosMartes.horas[key] != null) {
        await borrarCurso(Alumno.idAlumno, cursosMartes.horas[key].idCurso).then((value){
          if (value == 'exito') {
            cursosMartes.horas.update(key, (curso) => null, ifAbsent: () => null);
          } else {
            Fluttertoast.showToast(msg: 'Revisa tu conexión a internet');
            return;
          }
        });
      }
    }
  }

  _borrarCursosMiercoles(Miercoles cursosMiercoles) async {
    for (var key in cursosMiercoles.horas.keys.toList()) {
      if (cursosMiercoles.horas[key] != null) {
        await borrarCurso(Alumno.idAlumno, cursosMiercoles.horas[key].idCurso).then((value){
          if (value == 'exito') {
            cursosMiercoles.horas.update(key, (curso) => null, ifAbsent: () => null);
          } else {
            Fluttertoast.showToast(msg: 'Revisa tu conexión a internet');
            return;
          }
        });
      }
    }
  }

  _borrarCursosJueves(Jueves cursosJueves) async {
    for (var key in cursosJueves.horas.keys.toList()) {
      if (cursosJueves.horas[key] != null) {
        await borrarCurso(Alumno.idAlumno, cursosJueves.horas[key].idCurso).then((value){
          if (value == 'exito') {
            cursosJueves.horas.update(key, (curso) => null, ifAbsent: () => null);
          } else {
            Fluttertoast.showToast(msg: 'Revisa tu conexión a internet');
            return;
          }
        });
      }
    }
  }

  _confirmarCursos() {
    Lunes lunes = Provider.of<Lunes>(context);
    Martes martes = Provider.of<Martes>(context);
    Miercoles miercoles = Provider.of<Miercoles>(context);
    Jueves jueves = Provider.of<Jueves>(context);
    revisarCursos(Alumno.idAlumno, Alumno.semestre, lunes, martes, miercoles, jueves);
  }

}