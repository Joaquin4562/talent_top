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

  // GET y SET de la clase guardada
  get claseEntrada {
    return _prefs.getString('IntermedioPage') ?? 'LoginPage';
  }

  set claseEntrada(String value) {
    _prefs.setString('IntermedioPage', value);
  }
}
