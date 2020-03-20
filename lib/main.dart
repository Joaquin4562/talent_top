import 'package:flutter/material.dart';
import 'package:talent_top_v0_1/pages/horarios_page.dart';
import 'package:talent_top_v0_1/pages/login.page.dart';
import 'package:talent_top_v0_1/pages/newuser.page.dart';
import 'package:talent_top_v0_1/pages/page_intermedio.dart';
import 'package:talent_top_v0_1/pages/recuperar_contrase%C3%B1a_page.dart';
import 'package:talent_top_v0_1/pages/share_pref/preferencias_usuario.dart';
import 'package:talent_top_v0_1/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  print(prefs.claseEntrada.toString());
  runApp(MyApp());
  
}
class MyApp extends StatelessWidget {
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Talent Top',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      initialRoute: prefs.claseEntrada,
      routes: <String, WidgetBuilder>{
        'LoginPage':(BuildContext context)=> LoginPage(),
        'RegisterPage':(BuildContext context)=>NewUser(),
        'RecuperacionPage': (BuildContext context)=>RecuperarPassPage(),
        'HorariosPage':(BuildContext context)=>HorariosPage(),
        'IntermedioPage': (BuildContext context)=>PaginaIntermedia(),

      },
    );
  }
}