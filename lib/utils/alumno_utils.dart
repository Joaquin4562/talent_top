import 'dart:convert';

import 'package:talent_top_v0_1/server/http_requests.dart';

import 'package:talent_top_v0_1/class/alumno.dart';

Future<String> obtenerInfoAlumno(String matricula) {
  Map<String, String> body = {'matricula': matricula};
  return executeHttpRequest( urlFile: '/obtenerInfoAlumno.php', requestBody: body );
}

Future<String> decodeInfoAlumno(String matricula) async {
  return obtenerInfoAlumno(matricula).then((value) {
    try {
      final decodedData = json.decode(value);
      Alumno.fromJsonMap(decodedData);
      return "exito";
    } catch (e) {
      return null;
    }
  });
}
