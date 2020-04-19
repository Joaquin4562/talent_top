import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:talent_top_v0_1/providers/cursos.dart';

import 'package:talent_top_v0_1/server/http_requests.dart';

Future<String> solicitarcurso(String semestre){
  Map<String,String> body = {
    'semestre':semestre,
  };
  return executeHttpRequest( urlFile: '/cursoSemestre.php', requestBody: body );
}

Future<void> traerCursos(String semestre, Cursos cursosInner) async{
  return solicitarcurso(semestre).then((value){
    if (value == null) {
      Fluttertoast.showToast(msg: 'Revisa tu conexión a internet');
    }
    final decodedData = json.decode(value);
    cursosInner.fromJsonList(decodedData['cursosemestre']);
  });
}