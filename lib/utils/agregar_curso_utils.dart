import 'package:talent_top_v0_1/server/http_requests.dart';

const String urlFile = '/insertar_actualizar_curso.php';

agregarCurso(String idAlumno, String idCurso, String idCursoAnterior, String cambio) {
  Map<String, String> body = {
    'idAlumno'        : idAlumno,
    'idCurso'         : idCurso,
    'idCursoAnterior' : idCursoAnterior,
    'cambio'          : cambio
  };

  return executeHttpRequest(urlFile: urlFile, requestBody: body);
}