
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

const List<String> acceptedCharactersPassword = [
  'A', 'a', 'B', 'b', 'C', 'c', 'D', 'd', 'E', 'e', 'F', 'f', 'G', 'g', 'H', 'h', 'I', 'i', 'J', 'j', 
  'K', 'k', 'L', 'l', 'M', 'm', 'N', 'n', 'O', 'o', 'P', 'p', 'Q', 'q', 'R', 'r', 'S', 's', 'T', 't', 
  'U', 'u', 'V', 'v', 'W', 'w', 'X', 'x', 'Y', 'y', 'Z', 'z',
  '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
  '.', '@', '#', '\$', '-', '_', ' '
];

const List<int> acceptedSemesters = [
  2, 4, 6, 8
];

const int maxPasswordLength = 20;
const int minPasswordLength = 8;

const int minUpperCaseLetters = 1;
const int minLowerCaseLetters = 1;

const int numberEmailParts = 2;

const String acceptedFormatNC = '01F0';

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

  if (!validarNC(nc)) {
    print('error_nc');
    return false;
  }

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
  if (!validarContrasena(password)) {
    print('error_contraseña');
    return false;
  }

  print(registrarAlumno(nc, semestre, name, lastName, email, password));
  return true;

}

bool validarNC(String nc) => (validarLongNC(nc) && validarFormatoNC(nc)) ? true : false;

bool validarLongNC(String nc) => (nc.length != 9) ? false : true;

bool validarFormatoNC(String nc) => (nc.substring(2, 6) != acceptedFormatNC) ? false : true;

bool validarSemestre(String semestre){
  int sem;
  try{
    sem = int.parse(semestre);
    return validarSemestrePar(sem);
  } catch (FormatExcepcion) {
    return false;
  }
}

bool validarSemestrePar(int semestre) => (!acceptedSemesters.contains(semestre)) ? false : true;

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

bool validarContrasena(String password) => (validarMayusMinusContrasena(password) && validarFormatoContrasena(password) && validarLongContrasena(password));

bool validarMayusMinusContrasena(String password) {
  int upperCount = 0;
  int lowerCount = 0;
  for (int i = 0; i < password.length; i++) {
    if (password[i] == password[i].toUpperCase()) {
      upperCount++;
    } else {
      lowerCount++;
    }
  }
  if (upperCount < minUpperCaseLetters || lowerCount < minLowerCaseLetters) {
    return false;
  }
  return true;
}

bool validarFormatoContrasena(String password) {
  for (int i = 0; i < password.length; i++) {
    if (!acceptedCharactersPassword.contains(password[i])) {
      return false;
    }
  }
  return true;
}

bool validarLongContrasena(String password) => (password.length < minPasswordLength && password.length > maxPasswordLength) ? false : true; 