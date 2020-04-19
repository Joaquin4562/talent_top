import 'package:talent_top_v0_1/providers/lunes.dart';

bool validarHorarioLunes(Lunes lunes, String semestre) {
  switch(semestre) {
    case '2':
      if (lunes.horas['07:00:00'] != null && lunes.horas['07:55:00'] != null 
      && lunes.horas['08:50:00'] != null && lunes.horas['09:45:00'] == null 
      && lunes.horas['10:40:00'] != null && lunes.horas['11:35:00'] == null 
      && lunes.horas['12:30:00'] != null && lunes.horas['01:25:00'] == null 
      && lunes.horas['02:20:00'] == null) {
        return true;
      }
      break;
    case '4':
      if (lunes.horas['07:00:00'] != null && lunes.horas['07:55:00'] != null 
      && lunes.horas['08:50:00'] == null && lunes.horas['09:45:00'] != null 
      && lunes.horas['10:40:00'] != null && lunes.horas['11:35:00'] != null 
      && lunes.horas['12:30:00'] == null && lunes.horas['01:25:00'] != null 
      && lunes.horas['02:20:00'] != null) {
        return true;
      }
      break;
    case '6':
      if (lunes.horas['07:00:00'] != null && lunes.horas['07:55:00'] != null 
      && lunes.horas['08:50:00'] != null && lunes.horas['09:45:00'] != null 
      && lunes.horas['10:40:00'] == null && lunes.horas['11:35:00'] != null 
      && lunes.horas['12:30:00'] != null && lunes.horas['01:25:00'] != null 
      && lunes.horas['02:20:00'] != null) {
        return true;
      }
      break;
    case '8':
      if (lunes.horas['07:00:00'] != null && lunes.horas['07:55:00'] != null 
      && lunes.horas['08:50:00'] != null && lunes.horas['09:45:00'] != null 
      && lunes.horas['10:40:00'] != null && lunes.horas['11:35:00'] != null 
      && lunes.horas['12:30:00'] != null && lunes.horas['01:25:00'] != null 
      && lunes.horas['02:20:00'] != null) {
        return true;
      }
      break;
  }
  return false;
}