import 'package:talent_top_v0_1/server/http_requests.dart';

const String urlFile = '/eliminarCurso.php';

borrarCurso(String idAlumno, String idCurso) {
  Map<String, String> body = {
    'idAlumno'  : idAlumno,
    'idCurso'   : idCurso
  };
  return executeHttpRequest( urlFile: urlFile, requestBody: body );
}