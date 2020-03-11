import 'package:shared_preferences/shared_preferences.dart';
String matricula;
String contrasena;

class PreferenciasUsuario {


  SharedPreferences _prefs;

//get y set que permiten mantener la sesión 

  get pagina {
    return _prefs.getString('pagina') ?? 'HorariosPage';
  }

  set pagina(String pagina) {
    _prefs.setString('pagina', pagina);
  }
}
