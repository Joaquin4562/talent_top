import 'dart:convert';

import 'package:talent_top_v0_1/class/cursos.dart';
import 'package:talent_top_v0_1/server/http_requests.dart';

Future<String> solicitarcurso(String semestre, String dia){
  Map<String,String> body ={
    'semestre':semestre,
    'dia':dia
  };
  return executeHttpRequest(urlFile: '/cursoSemestreDia.php', requestBody: body);
}

Future<List<Curso>> traerCurso(String semestre, String dia) async{
  return solicitarcurso(semestre, dia).then((value){
    final decodedData = json.decode(value);
    final cursos = new Cursos.fromJsonList(decodedData['cursosemestredia']);
    print(cursos.items[0].autor);
    return cursos.items;
  });
}