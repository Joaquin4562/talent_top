import 'package:talent_top_v0_1/providers/martes.dart';

bool validarHorarioMartes(Martes martes, String semestre) {
  switch(semestre) {
    case '2':
      if (martes.horas['07:00:00'] != null && martes.horas['07:55:00'] != null 
      && martes.horas['08:50:00'] != null && martes.horas['09:45:00'] == null 
      && martes.horas['10:40:00'] != null && martes.horas['11:35:00'] == null 
      && martes.horas['12:30:00'] != null && martes.horas['01:25:00'] == null 
      && martes.horas['02:20:00'] == null) {
        return true;
      }
      break;
    case '4':
      if (martes.horas['07:00:00'] != null && martes.horas['07:55:00'] != null 
      && martes.horas['08:50:00'] == null && martes.horas['09:45:00'] != null 
      && martes.horas['10:40:00'] != null && martes.horas['11:35:00'] != null 
      && martes.horas['12:30:00'] != null && martes.horas['01:25:00'] != null 
      && martes.horas['02:20:00'] != null) {
        return true;
      }
      break;
    case '6':
      if (martes.horas['07:00:00'] != null && martes.horas['07:55:00'] != null 
      && martes.horas['08:50:00'] != null && martes.horas['09:45:00'] != null 
      && martes.horas['10:40:00'] == null && martes.horas['11:35:00'] != null 
      && martes.horas['12:30:00'] != null && martes.horas['01:25:00'] != null 
      && martes.horas['02:20:00'] != null) {
        return true;
      }
      break;
    case '8':
      if (martes.horas['07:00:00'] != null && martes.horas['07:55:00'] != null 
      && martes.horas['08:50:00'] != null && martes.horas['09:45:00'] != null 
      && martes.horas['10:40:00'] != null && martes.horas['11:35:00'] != null 
      && martes.horas['12:30:00'] != null && martes.horas['01:25:00'] != null 
      && martes.horas['02:20:00'] != null) {
        return true;
      }
      break;
  }
  return false;
}