import 'package:talent_top_v0_1/server/http_requests.dart';

const String acceptedFormatNC = '01F0';
const ncLength = 9;

const int minUpperCaseLetters = 1;
const int minLowerCaseLetters = 1;

const int maxPasswordLength = 20;
const int minPasswordLength = 8;

const List<String> acceptedCharactersPassword = [
  'A', 'a', 'B', 'b', 'C', 'c', 'D', 'd', 'E', 'e', 'F', 'f', 'G', 'g', 'H', 'h', 'I', 'i', 'J', 'j', 
  'K', 'k', 'L', 'l', 'M', 'm', 'N', 'n', 'O', 'o', 'P', 'p', 'Q', 'q', 'R', 'r', 'S', 's', 'T', 't', 
  'U', 'u', 'V', 'v', 'W', 'w', 'X', 'x', 'Y', 'y', 'Z', 'z',
  '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
  '.', '@', '#', '\$', '-', '_', ' '
];

String logearAlumno(String matricula, String password) {
  Map<String, String> body = {'matricula': matricula, 'contrasena': password};

  String resultado =
      executeHttpRequest(urlFile: '/loginAlumnos.php', requestBody: body)
          .toString();
  return resultado;
}

obtenerInfo(String nc, String password){


 if (!validarContrasena(password)) {
    print('error_contraseña');
    return false;
  }

    if (!validarNC(nc)) {
    print('error_nc');
    return false;
  }

print(logearAlumno(nc, password));
  return true;

}

bool validarNC(String nc) => (validarLongNC(nc) && validarFormatoNC(nc)) ? true : false;

bool validarLongNC(String nc) => (nc.length != ncLength) ? false : true;

bool validarFormatoNC(String nc) => (nc.substring(2, 6) != acceptedFormatNC) ? false : true;

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