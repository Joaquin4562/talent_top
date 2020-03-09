
//-------------------------------------CONSTANTES----------------------------------------------------

import 'package:talent_top_v0_1/server/http_requests.dart';

import 'package:talent_top_v0_1/utils/validations/email_validations.dart';
import 'package:talent_top_v0_1/utils/validations/name_validations.dart';

// const List<String> acceptedSemesters = [
//   '2', '4', '6', '8'
// ];

//-------------------------------------------MÉTODOS---------------------------------------------

void registrarAlumno(String nc, String semestre, String name, String lastName, String email, String password) {

  Map<String, String> body = {
    'matricula'   :  nc,
    'semestre'    : semestre,
    'nombre'      : name,
    'apellidos'   : lastName,
    'correo'      : email,
    'contrasena'  : password
  };

  executeHttpRequest(urlFile: '/registroAlumno.php', requestBody: body).toString();

}

int validarInfo(String nc, String semestre, String name, String lastName, String email, String password) {

  // if (!validarSemestre(semestre)) {
  //   print('error_semestre');
  //   return false;
  // }
  
  if (!validarNombre(name)) {
    return 1;
    
  }
  if (!validarNombre(lastName)) {
    return 2;
  }
  if (!validarEmail(email, nc)) {
    return 3;
  }
  
  registrarAlumno(nc, semestre, name, lastName, email, password);
  return 0;

}

// bool validarSemestre(String semestre) => (!acceptedSemesters.contains(semestre)) ? false : true;