import 'package:flutter/material.dart';

import 'package:talent_top_v0_1/class/curso.dart';

class Cursos with ChangeNotifier {
  
  List<Curso> _cursos = new List<Curso>();
  String _dia = 'Lunes';

  fromJsonList(List<dynamic> jsonList){
    if(jsonList == null)return;
    for (var item in jsonList) {
      final curso = new Curso.fromJsonMap(item);
      _cursos.add(curso);
    }
    notifyListeners();
  }

  get dia {
    return this._dia;
  }

  set dia(String dia) {
    this._dia = dia;
    notifyListeners();
  }

  get todosCursos {
    return this._cursos;
  }

  get cursos {
    List<Curso> cursos = new List();
    this._cursos.forEach((curso) {
      if (curso.dia == this._dia) {
        cursos.add(curso);
      }
    });
    return cursos;
  }

  set cursos(List<Curso> cursos) {
    this._cursos = cursos;
    notifyListeners();
  }

}

