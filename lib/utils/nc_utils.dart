import 'package:talent_top_v0_1/server/http_requests.dart';

Future<String> buscarMatricula(String nc) {
  Map<String, String> body = {
    'matricula'   :  nc
  };
  return executeHttpRequest(urlFile: '/buscarMatricula.php', requestBody: body);
}