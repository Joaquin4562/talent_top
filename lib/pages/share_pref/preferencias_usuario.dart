import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET para saber si hay sesión iniciada
  get sesion {
    return _prefs.getBool('sesion') ?? false;
  }

  set sesion (bool sesion) {
    _prefs.setBool('sesion', sesion);
  }

  // GET y SET para la matricula del alumno
  get matricula {
    return _prefs.getString('matricula');
  }

  set matricula (String matricula) {
    _prefs.setString('matricula', matricula);
  }

}
