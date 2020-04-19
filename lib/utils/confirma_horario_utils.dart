import 'package:fluttertoast/fluttertoast.dart';
import 'package:talent_top_v0_1/server/http_requests.dart';

import 'package:talent_top_v0_1/providers/lunes.dart';
import 'package:talent_top_v0_1/providers/martes.dart';
import 'package:talent_top_v0_1/providers/miercoles.dart';
import 'package:talent_top_v0_1/providers/jueves.dart';
import 'package:talent_top_v0_1/utils/validations/jueves_validations.dart';
import 'package:talent_top_v0_1/utils/validations/lunes_validations.dart';
import 'package:talent_top_v0_1/utils/validations/martes_validations.dart';
import 'package:talent_top_v0_1/utils/validations/miercoles_validations.dart';

const String urlFile = '/confirmarCursos.php';

Future<String> confirmarAlumno(String idAlumno) {
  Map<String, String> body = {
    'idAlumno' : idAlumno
  };
  return executeHttpRequest(urlFile: urlFile, requestBody: body);
}

revisarCursos(String idAlumno, String semestre, Lunes lunes, Martes martes, Miercoles miercoles, Jueves jueves) async {
  if (!validarHorarioLunes(lunes, semestre)) {
    Fluttertoast.showToast(msg: 'Horario del lunes incompleto');
    return;
  }
  if (!validarHorarioMartes(martes, semestre)) {
    Fluttertoast.showToast(msg: 'Horario del martes incompleto');
    return;
  }
  if (!validarHorarioMiercoles(miercoles, semestre)) {
    Fluttertoast.showToast(msg: 'Horario del miércoles incompleto');
    return;
  }
  if (!validarHorarioJueves(jueves, semestre)) {
    Fluttertoast.showToast(msg: 'Horario del jueves incompleto');
    return;
  }

  await confirmarAlumno(idAlumno).then((value) {
    if (value == 'exito') {
      Fluttertoast.showToast(msg: 'Horario confirmado');
    }
  });
}