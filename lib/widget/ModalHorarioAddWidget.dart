// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_horario2/data/database/database_helper.dart';
import 'package:flutter_horario2/widget/ButonWidget.dart';
import 'package:flutter_horario2/widget/FormTextWidget.dart';

class ModalHorarioAddWidget extends StatefulWidget {
  final Map<String, dynamic> materia;
  final Function onUpdate;


  const ModalHorarioAddWidget({
    super.key,
    required this.materia,
    required this.onUpdate,
  });

  @override
  State<ModalHorarioAddWidget> createState() => _ModalHorarioAddWidgetState();
}

class _ModalHorarioAddWidgetState extends State<ModalHorarioAddWidget> {
  String? selectedDay = 'Lunes';
  TimeOfDay? selectedTimeA;
  TimeOfDay? selectedTimeB;
  String? aula = '';
  final TextEditingController aulaController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              '${widget.materia['materia']}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            const Divider(),
            const Text(
              'Agregar Horario',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Dia de la Semana: ',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                _selectDay(),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'Hora Inicio.',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    TextButton(
                      onPressed: () {
                        _selectTimeA(context);
                      },
                      child: selectedTimeA != null
                          ? Text(
                              '${selectedTimeA!.hour.toString().padLeft(2, '0')}:${selectedTimeA!.minute.toString().padLeft(2, '0')}')
                          : const Text('Seleccionar'),
                    ),
                  ],
                ),
                const SizedBox(width: 70),
                Column(
                  children: [
                    const Text(
                      'Hora Final.',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    TextButton(
                      onPressed: () {
                        _selectTimeB(context);
                      },
                      child: selectedTimeB != null
                          ? Text(
                              '${selectedTimeB!.hour.toString().padLeft(2, '0')}:${selectedTimeB!.minute.toString().padLeft(2, '0')}')
                          : const Text('Seleccionar'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            FormTextWidget(
              text: 'Aula',
              controllerForm: aulaController,
              keyword: TextInputType.number,
              onValidator: (p0) => p0!.isEmpty ? 'Campo Requerido' : null,
            ),
            const SizedBox(height: 15),
            ButtonWidget(
              text: 'Guardar',
              textColor: Colors.white,
              textWeight: FontWeight.normal,
              buttonColor: Colors.black,
              onTap: () {
                _guardarDatos();
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  DropdownButton<String> _selectDay() {
    return DropdownButton<String>(
      value: selectedDay,
      items: <String>[
        'Lunes',
        'Martes',
        'Miercoles',
        'Jueves',
        'Viernes',
        'Sabado'
      ].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedDay = newValue;
        });
      },
    );
  }

  Future<void> _selectTimeA(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      helpText: 'Selecciona la Hora de inicio.',
      cancelText: 'Regresar',
      confirmText: 'Confirmar',
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedTimeA) {
      setState(() {
        selectedTimeA = pickedTime;
      });
    }
  }

  Future<void> _selectTimeB(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      helpText: 'Selecciona la Hora Final',
      cancelText: 'Regresar',
      confirmText: 'Confirmar',
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedTimeB) {
      setState(() {
        selectedTimeB = pickedTime;
      });
    }
  }

  void _guardarDatos() {
    // print('Dia: $selectedDay');
    // print('Hora Inicio: ${selectedTimeA!.format(context)}');
    // print('Hora Final: ${selectedTimeB!.format(context)}');
    // print('Aula: ${aulaController.text}');
    // print('MateriaID: ${widget.materia['id']}');
    if (_formKey.currentState!.validate()) {
      DatabaseHelper.instance.database.then((db) {
        db.insert('horarios', {
          'dia': selectedDay,
          'horaInicio': selectedTimeA!.format(context),
          'horaFinal': selectedTimeB!.format(context),
          'aula': aulaController.text,
          'materiaId': widget.materia['id']
        }).then((value) {
          widget.onUpdate(true);
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Horario Registrado'),
              backgroundColor: Colors.green,
            ),
          );
        }).catchError((error) {
          print('Error al insertar Horario: $error');
        });
      });
    }
  }
}
