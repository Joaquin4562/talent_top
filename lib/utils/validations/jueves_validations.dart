import 'package:talent_top_v0_1/providers/jueves.dart';

bool validarHorarioJueves(Jueves jueves, String semestre) {
  switch(semestre) {
    case '2':
      if (jueves.horas['07:00:00'] != null && jueves.horas['07:55:00'] != null 
      && jueves.horas['08:50:00'] != null && jueves.horas['09:45:00'] != null 
      && jueves.horas['10:40:00'] != null && jueves.horas['11:35:00'] == null 
      && jueves.horas['12:30:00'] != null && jueves.horas['01:25:00'] != null 
      && jueves.horas['02:20:00'] != null) {
        return true;
      }
      break;
    case '4':
      if (jueves.horas['07:00:00'] != null && jueves.horas['07:55:00'] != null 
      && jueves.horas['08:50:00'] == null && jueves.horas['09:45:00'] != null 
      && jueves.horas['10:40:00'] != null && jueves.horas['11:35:00'] != null 
      && jueves.horas['12:30:00'] == null && jueves.horas['01:25:00'] != null 
      && jueves.horas['02:20:00'] != null) {
        return true;
      }
      break;
    case '6':
      if (jueves.horas['07:00:00'] != null && jueves.horas['07:55:00'] != null 
      && jueves.horas['08:50:00'] != null && jueves.horas['09:45:00'] != null 
      && jueves.horas['10:40:00'] == null && jueves.horas['11:35:00'] != null 
      && jueves.horas['12:30:00'] == null && jueves.horas['01:25:00'] != null 
      && jueves.horas['02:20:00'] != null) {
        return true;
      }
      break;
    case '8':
      if (jueves.horas['07:00:00'] != null && jueves.horas['07:55:00'] != null 
      && jueves.horas['08:50:00'] != null && jueves.horas['09:45:00'] != null 
      && jueves.horas['10:40:00'] == null && jueves.horas['11:35:00'] != null 
      && jueves.horas['12:30:00'] != null && jueves.horas['01:25:00'] != null 
      && jueves.horas['02:20:00'] != null) {
        return true;
      }
      break;
  }
  return false;
}