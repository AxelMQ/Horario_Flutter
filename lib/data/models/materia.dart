class Materia {
  int? id;
  String? materia;
  String? sigla;
  String? grupo;
  String? docente;
  String? semestre;

  Materia(
      {this.id,
      this.materia,
      this.sigla,
      this.grupo,
      this.docente,
      this.semestre});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'materia': materia,
      'sigla': sigla,
      'grupo': grupo,
      'docente': docente,
      'semestre': semestre,
    };
  }

  factory Materia.fromMap(Map<String, dynamic> map) {
    return Materia(
      id: map['id'],
      materia: map['materia'],
      sigla: map['sigla'],
      grupo: map['grupo'],
      docente: map['docente'],
      semestre: map['semestre'],
    );
  }
}
