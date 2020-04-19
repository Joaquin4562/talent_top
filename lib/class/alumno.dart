class Alumno {
  static String idAlumno;
  static String matricula;
  static String semestre;
  static String nombre;
  static String apellidos;
  static String correo;
  static String contrasena;
  static String confirmado;

  Alumno.fromJsonMap(Map<dynamic, dynamic> json) {
    idAlumno    = json['idAlumno'];
    matricula   = json['matricula'];
    semestre    = json['semestre'];
    nombre      = json['nombre'];
    apellidos   = json['apellidos'];
    correo      = json['correo'];
    contrasena  = json['contrasena'];
    confirmado  = json['confirmado'];
  }
}