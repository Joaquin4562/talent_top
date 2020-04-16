import 'package:flutter/material.dart';

import 'package:talent_top_v0_1/class/curso.dart';

class Martes with ChangeNotifier {

  Map<String, Curso> _horas = {
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

  get horas {
    return _horas;
  }

  set horas(Map<String, Curso> horas) {
    this._horas = horas;
    notifyListeners();
  }

}