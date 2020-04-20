import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:talent_top_v0_1/pages/horario_completo_page.dart';

import 'package:talent_top_v0_1/pages/horarios_page.dart';
import 'package:talent_top_v0_1/pages/login.page.dart';
import 'package:talent_top_v0_1/pages/newuser.page.dart';
import 'package:talent_top_v0_1/pages/page_intermedio.dart';
import 'package:talent_top_v0_1/pages/recuperar_contrasena_page.dart';
import 'package:talent_top_v0_1/pages/splash_screen.dart';

import 'package:talent_top_v0_1/pages/share_pref/preferencias_usuario.dart';

import 'package:talent_top_v0_1/providers/cursos.dart';
import 'package:talent_top_v0_1/providers/jueves.dart';
import 'package:talent_top_v0_1/providers/lunes.dart';
import 'package:talent_top_v0_1/providers/martes.dart';
import 'package:talent_top_v0_1/providers/miercoles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => Cursos(),),
        ChangeNotifierProvider(builder: (context) => Lunes(),),
        ChangeNotifierProvider(builder: (context) => Martes(),),
        ChangeNotifierProvider(builder: (context) => Miercoles(),),
        ChangeNotifierProvider(builder: (context) => Jueves(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Talent Top',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          'LoginPage'         : (BuildContext context) => LoginPage(),
          'RegisterPage'      : (BuildContext context) => NewUser(),
          'RecuperacionPage'  : (BuildContext context) => RecuperarPassPage(),
          'HorariosPage'      : (BuildContext context) => HorariosPage(),
          'IntermedioPage'    : (BuildContext context) => PaginaIntermedia(),
          'HorarioCompletoPage':(BuildContext context) => HorarioCompletoPage(),
        },
      ),
    );
  }
}