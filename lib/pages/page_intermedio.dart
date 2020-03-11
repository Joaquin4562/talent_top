import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talent_top_v0_1/class/simple_animation_class.dart';

class PaginaIntermedia extends StatelessWidget {
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
                fit: BoxFit.cover),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.lightBlueAccent, Colors.redAccent]),
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
          )),
    ));
  }

  Widget _crearBotonVer(double width,context) {
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
                  fontSize: 20,
                  letterSpacing: 5,
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

  Widget _crearBotonCrear(double width,context) {
    return Container(
      width: width - 100,
      height: 50,
      child: RaisedButton(
          elevation: 10,
          color: Colors.red,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('HorariosPage');
          },
          child: ListTile(
            title: Text(
              'Crear horario',
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
          )),
    );
  }
}
