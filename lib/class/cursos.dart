class Cursos {
  List<Curso> items = new List();


  String horaInicio;
  String horaFin;
  String autor;
  String nombre;
  String semestre;
  String dia;
  String lugar;

  Cursos.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null)return;
    for (var item in jsonList) {
      final curso = new Curso.fromJsonMap(item);
    }
  }

  Cursos({this.autor, this.horaInicio, this.nombre, this.dia});
}

class Curso {
  String horaInicio;
  String horaFin;
  String autor;
  String nombre;
  String semestre;
  String dia;
  String idCurso;
  String lugar;
  Curso(this.idCurso,this.horaInicio, this.horaFin, this.autor, this.nombre, this.semestre,
      this.dia, this.lugar);
  Curso.fromJsonMap(Map<String, String> json) {
    idCurso    = json['idCurso'];
    horaInicio = json['horaInicio'];
    horaFin    = json['horaFin'];
    autor      = json['responsable'];
    nombre     = json['nombreCurso'];
    semestre   = json['semestre'];
    dia        = json['dia'];
    lugar      = json['lugar'];
  }
}
