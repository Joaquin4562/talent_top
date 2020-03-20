import 'package:fluttertoast/fluttertoast.dart';
import 'package:talent_top_v0_1/server/http_requests.dart';

const String acceptedFormatNC = '01F0';
const ncLength = 9;

const int minUpperCaseLetters = 1;
const int minLowerCaseLetters = 1;

const int maxPasswordLength = 20;
const int minPasswordLength = 8;

const List<String> acceptedCharactersPassword = [
  'A',
  'a',
  'B',
  'b',
  'C',
  'c',
  'D',
  'd',
  'E',
  'e',
  'F',
  'f',
  'G',
  'g',
  'H',
  'h',
  'I',
  'i',
  'J',
  'j',
  'K',
  'k',
  'L',
  'l',
  'M',
  'm',
  'N',
  'n',
  'O',
  'o',
  'P',
  'p',
  'Q',
  'q',
  'R',
  'r',
  'S',
  's',
  'T',
  't',
  'U',
  'u',
  'V',
  'v',
  'W',
  'w',
  'X',
  'x',
  'Y',
  'y',
  'Z',
  'z',
  '0',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '.',
  '@',
  '#',
  '\$',
  '-',
  '_',
  ' '
];

Future<String> logearAlumno(String matricula, String password) {
  Map<String, String> body = {
  'matricula': matricula, 
  'contrasena': password
  };

   return executeHttpRequest(urlFile: '/loginAlumnos.php', requestBody: body);
    
  
}

Future<String> obtenerInfo(String nc, String password) {

  return logearAlumno(nc, password);

}

bool validarNC(String nc) => (validarLongNC(nc) && validarFormatoNC(nc)) ? true : false;

bool validarLongNC(String nc) => (nc.length != ncLength) ? false : true;

bool validarFormatoNC(String nc) => (nc.substring(2, 6) != acceptedFormatNC) ? false : true;
