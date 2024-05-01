import 'package:flutter/material.dart';
import 'package:flutter_horario2/data/models/materia.dart';
import 'package:flutter_horario2/widget/FormTextWidget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'EditMateria/ActionButtonWidget.dart';

class EditButtonWidget extends StatelessWidget {
  final Materia materia;
  const EditButtonWidget({
    super.key,
    required this.materia,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit_square),
      onPressed: () {
        print('EDIT --> ${materia.materia}');
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Editar Materia',
                  style: GoogleFonts.anekTamil(
                      fontWeight: FontWeight.w500, fontSize: 27),
                ),
                content: ContentEditDialog(
                  materia: materia,
                ),
                actions: [
                  ActionButtonWidget(
                    text: 'Cancelar',
                    size: 15,
                    color: const Color.fromARGB(255, 23, 103, 168),
                    function: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const ActionButtonWidget(
                      text: 'Guardar Cambios.',
                      size: 17,
                      color: Color.fromARGB(255, 182, 50, 41))
                ],
              );
            });
      },
    );
  }
}

class ContentEditDialog extends StatefulWidget {
  final Materia materia;

  const ContentEditDialog({
    super.key,
    required this.materia,
  });

  @override
  State<ContentEditDialog> createState() => _ContentEditDialogState();
}

class _ContentEditDialogState extends State<ContentEditDialog> {
  late TextEditingController materiaController;
  late TextEditingController siglaController;
  late TextEditingController grupoController;
  late TextEditingController docenteController;
  late TextEditingController semestreController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    materiaController = TextEditingController(text: widget.materia.materia);
    siglaController = TextEditingController(text: widget.materia.sigla);
    grupoController = TextEditingController(text: widget.materia.grupo);
    docenteController = TextEditingController(text: widget.materia.docente);
    semestreController = TextEditingController(text: widget.materia.semestre);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            FormTextWidget(
              text: 'Materia',
              controllerForm: materiaController,
              onValidator: (p0) => p0!.isEmpty ? 'Campo Requerido' : null,
            ),
            const SizedBox(height: 13),
            FormTextWidget(
              text: 'Sigla',
              controllerForm: siglaController,
              onValidator: (p0) => p0!.isEmpty ? 'Campo Requerido' : null,
            ),
            const SizedBox(height: 13),
            FormTextWidget(
              text: 'Grupo',
              controllerForm: grupoController,
              onValidator: (p0) => p0!.isEmpty ? 'Campo Requerido' : null,
            ),
            const SizedBox(height: 13),
            FormTextWidget(
              text: 'Docente',
              controllerForm: docenteController,
              onValidator: (p0) => p0!.isEmpty ? 'Campo Requerido' : null,
            ),
            const SizedBox(height: 13),
            FormTextWidget(
              text: 'Semestre',
              controllerForm: semestreController,
              onValidator: (p0) => p0!.isEmpty ? 'Campo Requerido' : null,
            )
          ],
        ),
      ),
    );
  }
}
