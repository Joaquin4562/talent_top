import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';

//Cambiar el url por el del servidos que se vaya a usar
const String urlServer = 'http://192.168.56.1/toptalent';

Future<Object> executeHttpRequest({@required String urlFile, @required dynamic requestBody}) async {

  String urlFinal = urlServer + urlFile;
  var client = http.Client();
  try {
    var httpResponse = await client.post(urlFinal, body: requestBody);
    return httpResponse;
  } finally {
    client.close();
  }

}