
//-------------------------------------CONSTANTES----------------------------------------------------

import 'package:talent_top_v0_1/server/http_requests.dart';

const String acceptedDomain = 'itsmante.edu.mx';

const List<String> acceptedCharactersName = [
  'A', 'a', 'B', 'b', 'C', 'c', 'D', 'd', 'E', 'e', 'F', 'f', 'G', 'g', 'H', 'h', 'I', 'i', 'J', 'j', 
  'K', 'k', 'L', 'l', 'M', 'm', 'N', 'n', 'O', 'o', 'P', 'p', 'Q', 'q', 'R', 'r', 'S', 's', 'T', 't', 
  'U', 'u', 'V', 'v', 'W', 'w', 'X', 'x', 'Y', 'y', 'Z', 'z', ' '
];

const List<String> acceptedCharactersEmail = [
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 
   'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 
   'u', 'v', 'w', 'x', 'y', 'z',
   '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.'
];

const List<String> acceptedSemesters = [
  '2', '4', '6', '8'
];

const int numberEmailParts = 2;

//-------------------------------------------MÉTODOS---------------------------------------------

String registrarAlumno(String nc, String semestre, String name, String lastName, String email, String password) {

  Map<String, String> body = {
    'matricula'   :  nc,
    'semestre'    : semestre,
    'nombre'      : name,
    'apellidos'   : lastName,
    'correo'      : email,
    'contrasena'  : password
  };

  String resultado = executeHttpRequest(urlFile: '/registroAlumno.php', requestBody: body).toString();
  return resultado;

}

bool obtenerInfo(String nc, String semestre, String name, String lastName, String email, String password) {

  if (!validarSemestre(semestre)) {
    print('error_semestre');
    return false;
  }
  if (!validarNombre(name)) {
    print('error_nombre');
    return false;
    
  }
  if (!validarNombre(lastName)) {
    print('error_apellido');
    return false;
  }
  if (!validarEmail(email)) {
    print('error_email');
    return false;
  }

  print(registrarAlumno(nc, semestre, name, lastName, email, password));
  return true;

}

bool validarSemestre(String semestre) => (!acceptedSemesters.contains(semestre)) ? false : true;

bool validarNombre(String name){
  for (int i = 0; i < name.length; i++) {
    if (!acceptedCharactersName.contains(name[i])) {
      return false;
    }
  }
  return true;
}

bool validarEmail(String email) {
  List<String> emailParts = email.split('@');
  return (validarArroba(emailParts) && validarFormatoEmail(emailParts[0]) && validarDominio(emailParts[1]));
}

bool validarFormatoEmail(String email) {
  for (int i = 0; i < email.length; i++) {
    if (!acceptedCharactersEmail.contains(email[i])) {
      return false;
    }
  }
  return true;
}

bool validarArroba(List<String> emailParts) => (emailParts.length != numberEmailParts) ? false : true;

bool validarDominio(String dominio) => (dominio !=  acceptedDomain) ? false : true;