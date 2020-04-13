import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talent_top_v0_1/class/simple_animation_class.dart';
import 'package:talent_top_v0_1/pages/share_pref/preferencias_usuario.dart';
import 'package:talent_top_v0_1/utils/curso_utils.dart';

class PaginaIntermedia extends StatefulWidget {

  @override
  _PaginaIntermediaState createState() => _PaginaIntermediaState();
}

class _PaginaIntermediaState extends State<PaginaIntermedia> {

  final prefs = new PreferenciasUsuario();

  @override
  void initState() { 
    super.initState();
    //prefs.claseEntrada = 'IntermedioPage';
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: FadeAnimation(0.4,Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/cohete.png'),
                fit: height < 600 ? BoxFit.fill:BoxFit.cover),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.lightBlueAccent, Colors.redAccent]),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
               FadeAnimation(0.6,Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Image(image: AssetImage('assets/images/logo.png')),
                )),
                FadeAnimation(0.7,_crearBotonCrear(width,height, context)),
                FadeAnimation(0.7,_crearBotonVer(width, height, context)),
                SizedBox(height: 50,),
                FadeAnimation(0.6, _crearBotonSalir(width, height, context))
              ],
            ),
          )),
    ));
  }

  Widget _crearBotonVer(double width,double height,context) {
    return Container(
      width: width - 100,
      height: 50,
      child: RaisedButton(
          elevation: 10,
          color: Colors.red,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {
            Fluttertoast.showToast(msg: 'Horario aun no creado',);
          },
          child: ListTile(
            title: Text(
              'Ver horario',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: height < 600 ? 17:20,
                  letterSpacing: height < 600 ? 3:5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            trailing: Icon(
              Icons.calendar_today,
              color: Colors.white,
            ),
          )),
    );
  }

  Widget _crearBotonCrear(double width,double height,context) {
    return Container(
      width: width - 100,
      height: 50,
      child: RaisedButton(
          elevation: 10,
          color: Colors.red,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {
            traerCurso('6', 'Lunes');
            Navigator.of(context).pushReplacementNamed('HorariosPage');
          },
          child: ListTile(
            title: Text(
              'Crear horario',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: height < 600 ? 17:20,
                  letterSpacing: height < 600 ? 3:5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            trailing: Icon(
              Icons.create,
              color: Colors.white,
            ),
          )),
    );
  }
  Widget _crearBotonSalir(double width,double height,context) {
    return Container(
      width: width - 150,
      height: 50,
      child: RaisedButton(
          elevation: 10,
          color: Colors.red,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('LoginPage');
            
          },
          child: ListTile(
            title: Text(
              'Cerrar sesión',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: height < 600 ? 17:19,
                  letterSpacing: height < 600 ? 0:2,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            trailing: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          )),
    );
  }

}
