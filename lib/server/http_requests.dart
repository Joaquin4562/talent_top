import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';

//Cambiar el url por el del servidos que se vaya a usar
const String urlServer = 'http://mante.hosting.acm.org/TopTalent';

Future<Object> executeHttpRequest({@required String urlFile, @required dynamic requestBody}) async {

  final String urlFinal = urlServer + urlFile;
  var client = http.Client();
  try {
    var httpResponse = await client.post(urlFinal, body: requestBody);
    return httpResponse;
  } finally {
    client.close();
  }

}