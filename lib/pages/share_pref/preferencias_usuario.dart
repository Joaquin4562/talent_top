import 'package:shared_preferences/shared_preferences.dart';
  
  
  String matricula;
  String contrasena;

class PreferenciasUsuario {
  

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del Genero
  get claseEntrada {
    return _prefs.getInt('IntermedioPage') ?? 1;
  }

  set claseEntrada( String value ) {
    _prefs.setString('IntermedioPage', value);
  }
  }