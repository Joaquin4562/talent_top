import 'dart:convert';

import 'package:talent_top_v0_1/class/curso.dart';

import 'package:talent_top_v0_1/providers/lunes.dart';
import 'package:talent_top_v0_1/providers/martes.dart';
import 'package:talent_top_v0_1/providers/miercoles.dart';
import 'package:talent_top_v0_1/providers/jueves.dart';

import 'package:talent_top_v0_1/server/http_requests.dart';

const String urlFile = '/cursosAlumno.php';

Future<String> buscarCurso(String matricula) {
  Map<String, String> body = {
    'matricula' : matricula,
  };
  return executeHttpRequest(urlFile: urlFile, requestBody: body);
}

Future<void> actualizarHorario(String matricula, Lunes lunes, Martes martes, Miercoles miercoles, Jueves jueves) {
  return buscarCurso(matricula).then((value) {
    final decodedData = json.decode(value);
    cargarCursos(decodedData['cursosalumno'], lunes, martes, miercoles, jueves);
  });
}

cargarCursos(List<dynamic> jsonList, Lunes lunes, Martes martes, Miercoles miercoles, Jueves jueves) {
  List<Curso> cursosLunes     = new List<Curso>();
  List<Curso> cursosMartes    = new List<Curso>();
  List<Curso> cursosMiercoles = new List<Curso>();
  List<Curso> cursosJueves    = new List<Curso>();
  if(jsonList == null) 
    return;
  for (var item in jsonList) {
    final curso = new Curso.fromJsonMap(item);
    switch (curso.dia) {
      case 'Lunes':
        cursosLunes.add(curso);
        break;
      case 'Martes':
        cursosMartes.add(curso);
        break;
      case 'Miercoles':
        cursosMiercoles.add(curso);
        break;
      case 'Jueves':
        cursosJueves.add(curso);
        break;
    }
  }
  cargarHorarioLunes(cursosLunes, lunes);
  cargarHorarioMartes(cursosMartes, martes);
  cargarHorarioMiercoles(cursosMiercoles, miercoles);
  cargarHorarioJueves(cursosJueves, jueves);
}

cargarHorarioLunes(List<Curso> cursosLunes, Lunes lunes) {
  Map<String, Curso> horario = {
    '07:00:00': null,
    '07:55:00': null,
    '08:50:00': null,
    '09:45:00': null,
    '10:40:00': null,
    '11:35:00': null,
    '12:30:00': null,
    '01:25:00': null,
    '02:20:00': null
  };
  cursosLunes.forEach((curso) {
    bool encontro = false;

    for (var key in horario.keys.toList()) {
      if (key == curso.horaInicio)
        encontro = true;
      if (key == curso.horaFin)
        encontro = false;
      if (encontro) {
        horario.update(key, (valorExistente) { 
          return curso;
        },
        ifAbsent: () => null);
      }
    }
    encontro = false;
  });
  lunes.horas = horario;
}

cargarHorarioMartes(List<Curso> cursosMartes, Martes martes) {
  Map<String, Curso> horario = {
    '07:00:00': null,
    '07:55:00': null,
    '08:50:00': null,
    '09:45:00': null,
    '10:40:00': null,
    '11:35:00': null,
    '12:30:00': null,
    '01:25:00': null,
    '02:20:00': null
  };
  cursosMartes.forEach((curso) {
    bool encontro = false;

    for (var key in horario.keys.toList()) {
      if (key == curso.horaInicio)
        encontro = true;
      if (key == curso.horaFin)
        encontro = false;
      if (encontro) {
        horario.update(key, (valorExistente) { 
          return curso;
        },
        ifAbsent: () => null);
      }
    }
    encontro = false;
  });
  martes.horas = horario;
}

cargarHorarioMiercoles(List<Curso> cursosMiercoles, Miercoles miercoles) {
  Map<String, Curso> horario = {
    '07:00:00': null,
    '07:55:00': null,
    '08:50:00': null,
    '09:45:00': null,
    '10:40:00': null,
    '11:35:00': null,
    '12:30:00': null,
    '01:25:00': null,
    '02:20:00': null
  };
  cursosMiercoles.forEach((curso) {
    bool encontro = false;

    for (var key in horario.keys.toList()) {
      if (key == curso.horaInicio)
        encontro = true;
      if (key == curso.horaFin)
        encontro = false;
      if (encontro) {
        horario.update(key, (valorExistente) { 
          return curso;
        },
        ifAbsent: () => null);
      }
    }
    encontro = false;
  });
  miercoles.horas = horario;
}

cargarHorarioJueves(List<Curso> cursosJueves, Jueves jueves) {
  Map<String, Curso> horario = {
    '07:00:00': null,
    '07:55:00': null,
    '08:50:00': null,
    '09:45:00': null,
    '10:40:00': null,
    '11:35:00': null,
    '12:30:00': null,
    '01:25:00': null,
    '02:20:00': null
  };
  cursosJueves.forEach((curso) {
    bool encontro = false;

    for (var key in horario.keys.toList()) {
      if (key == curso.horaInicio)
        encontro = true;
      if (key == curso.horaFin)
        encontro = false;
      if (encontro) {
        horario.update(key, (valorExistente) { 
          return curso;
        },
        ifAbsent: () => null);
      }
    }
    encontro = false;
  });
  jueves.horas = horario;
}

