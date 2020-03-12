
//-------------------------------------CONSTANTES----------------------------------------------------

import 'package:talent_top_v0_1/server/http_requests.dart';

import 'package:talent_top_v0_1/utils/validations/email_validations.dart';
import 'package:talent_top_v0_1/utils/validations/name_validations.dart';
import 'package:talent_top_v0_1/utils/validations/password_validation.dart';

//-------------------------------------------MÉTODOS---------------------------------------------

Future<String> registrarAlumno(String nc, String semestre, String name, String lastName, String email, String password) {

  Map<String, String> body = {
    'matricula'   :  nc,
    'semestre'    : semestre,
    'nombre'      : name,
    'apellidos'   : lastName,
    'correo'      : email,
    'contrasena'  : password
  };

  return executeHttpRequest(urlFile: '/registroAlumno.php', requestBody: body);

}

dynamic validarInfo(String nc, String semestre, String name, String lastName, String email, String password) {

  if (!nullInput(semestre, name, lastName, email, password)) {
    return 5;
  }

  if (!validarNombre(name)) {
    return 1;
  }
  if (!validarNombre(lastName)) {
    return 2;
  }
  if (!validarEmail(email, nc)) {
    return 3;
  }
  if (!validarContrasena(password)) {
    return 4;
  }

  return registrarAlumno(nc, semestre, name, lastName, email, password);

}

bool nullInput(String semestre, String name, String lastName, String email, String password) => (nullName(name) && nullName(lastName) && nullEmail(email) && nullPassword(password));