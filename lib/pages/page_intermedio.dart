import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';

import 'package:talent_top_v0_1/class/alumno.dart';
import 'package:talent_top_v0_1/class/simple_animation_class.dart';

import 'package:talent_top_v0_1/pages/share_pref/preferencias_usuario.dart';

import 'package:talent_top_v0_1/providers/cursos.dart';
import 'package:talent_top_v0_1/providers/jueves.dart';
import 'package:talent_top_v0_1/providers/lunes.dart';
import 'package:talent_top_v0_1/providers/martes.dart';
import 'package:talent_top_v0_1/providers/miercoles.dart';

import 'package:talent_top_v0_1/utils/curso_utils.dart';
import 'package:talent_top_v0_1/utils/cursos_alumno_utils.dart';

class PaginaIntermedia extends StatefulWidget {

  @override
  _PaginaIntermediaState createState() => _PaginaIntermediaState();
}

class _PaginaIntermediaState extends State<PaginaIntermedia> {

  final prefs = new PreferenciasUsuario();

  @override
  void initState() { 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: FadeAnimation(0.4, Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cohete.png'),
            fit: BoxFit.cover
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.lightBlueAccent, Colors.redAccent]
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FadeAnimation(0.6,Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image(image: AssetImage('assets/images/logo.png')),
              )),
              FadeAnimation(0.7,_crearBotonCrear(width,context)),
              SizedBox(height: 30,),
              FadeAnimation(0.7,_crearBotonVer(width,context)),
            ],
          ),
        )
      ),)
    );
  }

  Widget _crearBotonVer(double width,context) {
    return Container(
      width: width - 100,
      height: 50,
      child: RaisedButton(
        elevation: 10,
        color: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          Fluttertoast.showToast(msg: 'Horario aun no creado',);
        },
        child: ListTile(
          title: Text( 'Ver horario',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 5,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
          trailing: Icon(
            Icons.calendar_today,
            color: Colors.white,
          ),
        )
      ),
    );
  }

  Widget _crearBotonCrear(double width,context) {

    final Cursos cursos = Provider.of<Cursos>(context);

    return Container(
      width: width - 100,
      height: 50,
      child: RaisedButton(
        elevation: 10,
        color: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          _abrirPaginaCursos(cursos, context);
        },
        child: ListTile(
          title: Text( 'Crear horario',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 5,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          ),
          trailing: Icon(
            Icons.create,
            color: Colors.white,
          ),
        )
      ),
    );
  }

  _abrirPaginaCursos(Cursos cursosInner, BuildContext context) async {

    Lunes lunes = Provider.of<Lunes>(context);
    Martes martes = Provider.of<Martes>(context);
    Miercoles miercoles = Provider.of<Miercoles>(context);
    Jueves jueves = Provider.of<Jueves>(context);

    await traerCursos(Alumno.semestre, cursosInner);
    await actualizarHorario(Alumno.matricula, lunes, martes, miercoles, jueves);
    Navigator.of(context).pushReplacementNamed('HorariosPage');
  }

}
