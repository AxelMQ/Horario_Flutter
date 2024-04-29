import 'package:flutter/material.dart';
import 'package:flutter_horario2/data/database/database_helper.dart';

import 'ButonWidget.dart';
import 'FormTextWidget.dart';

class FormRegisterMateria extends StatefulWidget {
  const FormRegisterMateria({
    super.key,
  });

  @override
  State<FormRegisterMateria> createState() => _FormRegisterMateriaState();
}

class _FormRegisterMateriaState extends State<FormRegisterMateria> {
  final TextEditingController materiaController = TextEditingController();
  final TextEditingController siglaController = TextEditingController();
  final TextEditingController grupoController = TextEditingController();
  final TextEditingController docenteController = TextEditingController();
  final TextEditingController semestreController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormTextWidget(
            text: 'Materia',
            controllerForm: materiaController,
            onValidator: (p0) => p0!.isEmpty ? 'Campo Requerido' : null,
          ),
          const SizedBox(height: 10),
          FormTextWidget(
            text: 'Sigla',
            controllerForm: siglaController,
            onValidator: (p0) => p0!.isEmpty ? 'Campo Requerido' : null,
            convertToUpperCase: true,
          ),
          const SizedBox(height: 10),
          FormTextWidget(
            text: 'Grupo',
            controllerForm: grupoController,
            onValidator: (p0) => p0!.isEmpty ? 'Campo Requerido' : null,
            convertToUpperCase: true,
          ),
          const SizedBox(height: 10),
          FormTextWidget(
            text: 'Docente',
            controllerForm: docenteController,
            onValidator: (p0) => p0!.isEmpty ? 'Campo Requerido' : null,
            
          ),
          const SizedBox(height: 10),
          FormTextWidget(
            text: 'Semestre',
            controllerForm: semestreController,
            onValidator: (p0) => p0!.isEmpty ? 'Campo Requerido' : null,
            keyword: TextInputType.number,
          ),
          const SizedBox(height: 10),
          ButtonWidget(
            text: 'Registrar Materia',
            textColor: Colors.white,
            textWeight: FontWeight.bold,
            buttonColor: Colors.black12,
            onTap: () {
              // print('Materia: ' + materiaController.text);
              // print('Sigla: ' + siglaController.text);
              // print('Grupo: ' + grupoController.text);
              // print('Docente: ' + docenteController.text);
              // print('Semestre: ' + semestreController.text);
              if (_formKey.currentState!.validate()) {
                DatabaseHelper.instance.database.then((db) {
                  db.insert('materias', {
                    'materia': materiaController.text,
                    'sigla': siglaController.text,
                    'grupo': grupoController.text,
                    'docente': docenteController.text,
                    'semestre': semestreController.text,
                  }).then((value) {
                    materiaController.clear();
                    siglaController.clear();
                    grupoController.clear();
                    docenteController.clear();
                    semestreController.clear();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Materia Registrada'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }).catchError((error) {
                    print('Error al insertar materia: $error');
                  });
                });
              }
            },
          )
        ],
      ),
    );
  }
}
