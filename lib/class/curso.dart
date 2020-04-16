class Curso {
  
  String idCurso;
  String nombreCurso;
  String matriculaResponsable;
  String responsable;
  String dia;
  String horaInicio;
  String horaFin;
  String lugar;
  String cupo;
  String mismoCurso;
  String semestre;

  Curso(this.idCurso,this.horaInicio, this.horaFin, this.responsable, this.nombreCurso, this.semestre, this.dia, this.lugar);

  Curso.fromJsonMap(Map<dynamic, dynamic> json) {
    idCurso               = json['idCurso'];
    nombreCurso           = json['nombreCurso'];
    matriculaResponsable  = json['matriculaResponsable'];
    responsable           = json['responsable'];
    dia                   = json['dia'];
    horaInicio            = json['horaInicio'];
    horaFin               = json['horaFin'];
    lugar                 = json['lugar'];
    cupo                  = json['cupo'];
    mismoCurso            = json['mismoCurso'];
    semestre              = json['semestre'];
  }

}
