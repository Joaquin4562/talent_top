const List<String> acceptedSemesters = [
  '2', '4', '6', '8'
];

bool validarSemestre(String semestre) => (!acceptedSemesters.contains(semestre)) ? false : true;

bool nullSemester(String semestre) => !(semestre.isEmpty || semestre == null);