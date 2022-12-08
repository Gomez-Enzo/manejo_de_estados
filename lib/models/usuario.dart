class Usuario {
  Usuario({this.nombre, this.edad, this.profesiones});
  final String? nombre;
  final int? edad;
  final List<String>? profesiones;

  Usuario copyWith({
    String? nombre,
    int? edad,
    List<String>? profesiones,
  }) =>
      Usuario(
        nombre: nombre ?? this.nombre,
        edad: edad ?? this.edad,
        profesiones: profesiones ?? this.profesiones,
      );
}
