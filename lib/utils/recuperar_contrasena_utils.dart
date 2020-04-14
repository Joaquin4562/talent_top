import 'package:talent_top_v0_1/server/http_requests.dart';


Future<String> enviarCorreo(String matricula){
  Map<String,String> body = {
    'matricula':matricula
  };
  return executeHttpRequest(urlFile: "/mail.php", requestBody: body);
}
Future<String> sendEmail(String matricula) {
  return enviarCorreo(matricula);
}