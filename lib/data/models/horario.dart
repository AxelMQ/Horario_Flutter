class Horario {
  int? id;
  String? dia;
  String? horaInicio;
  String? horaFinal;
  String? aula;
  int? materiaId;

  Horario({this.id, this.dia, this.horaInicio, this.horaFinal, this.aula, this.materiaId});

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'dia' : dia,
      'horaInicio' : horaInicio,
      'horaFinal' : horaFinal,
      'aula' : aula,
      'materiaId' : materiaId,
    };
  }

  factory Horario.fromMap(Map<String, dynamic> map){
    return Horario(
      id: map['id'],
      dia: map['dia'],
      horaInicio: map['horaInicio'],
      horaFinal: map['horaFinal'],
      aula: map['aula'],
      materiaId: map['materiaId'],
    );
  }
}
