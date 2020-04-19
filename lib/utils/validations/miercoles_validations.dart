import 'package:talent_top_v0_1/providers/miercoles.dart';

bool validarHorarioMiercoles(Miercoles miercoles, String semestre) {
  print(semestre);
  switch(semestre) {
    case '2':
      if (miercoles.horas['07:00:00'] != null && miercoles.horas['07:55:00'] != null 
      && miercoles.horas['08:50:00'] != null && miercoles.horas['09:45:00'] == null 
      && miercoles.horas['10:40:00'] != null && miercoles.horas['11:35:00'] == null 
      && miercoles.horas['12:30:00'] != null && miercoles.horas['01:25:00'] == null 
      && miercoles.horas['02:20:00'] == null) {
        return true;
      }
      break;
    case '4':
      if (miercoles.horas['07:00:00'] != null && miercoles.horas['07:55:00'] != null 
      && miercoles.horas['08:50:00'] == null && miercoles.horas['09:45:00'] != null 
      && miercoles.horas['10:40:00'] != null && miercoles.horas['11:35:00'] != null 
      && miercoles.horas['12:30:00'] == null && miercoles.horas['01:25:00'] != null 
      && miercoles.horas['02:20:00'] != null) {
        return true;
      }
      break;
    case '6':
      if (miercoles.horas['07:00:00'] != null && miercoles.horas['07:55:00'] != null 
      && miercoles.horas['08:50:00'] != null && miercoles.horas['09:45:00'] == null 
      && miercoles.horas['10:40:00'] != null && miercoles.horas['11:35:00'] != null 
      && miercoles.horas['12:30:00'] == null && miercoles.horas['01:25:00'] != null 
      && miercoles.horas['02:20:00'] != null) {
        return true;
      }
      break;
    case '8':
      if (miercoles.horas['07:00:00'] != null && miercoles.horas['07:55:00'] != null 
      && miercoles.horas['08:50:00'] != null && miercoles.horas['09:45:00'] != null 
      && miercoles.horas['10:40:00'] != null && miercoles.horas['11:35:00'] != null 
      && miercoles.horas['12:30:00'] != null && miercoles.horas['01:25:00'] != null 
      && miercoles.horas['02:20:00'] != null) {
        return true;
      }
      break;
  }
  return false;
}