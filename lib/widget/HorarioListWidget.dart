import 'package:flutter/material.dart';
import 'package:flutter_horario2/data/database/database_helper.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/MateriaDetailScreen.dart';
import 'HorarioListWidget/IconButtonWidget.dart';
import 'HorarioListWidget/TableColumn.dart';
import 'HorarioListWidget/TableDataRow.dart';

class HorarioListWidget extends StatelessWidget {
  final MateriaDetailScreen widget;
  final int materiaId;
  final Function onUpdate;

  const HorarioListWidget({
    super.key,
    required this.widget,
    required this.onUpdate,
    required this.materiaId,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DatabaseHelper.instance.getHorarioMateria(materiaId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          List<Map<String, dynamic>> horarios = snapshot.data!;
          if (horarios.isEmpty) {
            return const Center(
              child: Text(
                'No hay horarios registrados para esta Materia.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                ),
              ),
            );
          } else {
            return Table(
              border: TableBorder.all(width: 1.0, color: Colors.black26),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              defaultColumnWidth: const FlexColumnWidth(1.0),
              children: [
                TableRow(
                    decoration: BoxDecoration(color: Colors.blueGrey[100]),
                    children: const [
                      TableColumn(text: 'DIA'),
                      TableColumn(text: 'HORA'),
                      TableColumn(text: 'ACCIONES'),
                    ]),
                for (var horario in horarios)
                  TableRow(children: [
                    TableDataRow(horario: horario, text: 'dia'),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('${horario['horaInicio']} ',
                              style: GoogleFonts.abel()),
                          Text('${horario['horaFinal']}',
                              style: GoogleFonts.abel()),
                          const Divider(),
                          Text('${horario['aula']}',
                              style: GoogleFonts.abel(fontSize: 14))
                        ],
                      ),
                    )),
                    TableCell(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButtonWidget(
                          icon: Icons.delete,
                          color: const Color.fromARGB(255, 219, 73, 63),
                          onPressed: () {
                            dialogDeleteMethod(context, horario);
                          },
                        ),
                        IconButtonWidget(
                          icon: Icons.edit,
                          color: const Color.fromARGB(255, 67, 145, 70),
                          onPressed: () {
                            print('Edit click');
                          },
                        ),
                      ],
                    ))
                  ])
              ],
            );
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Future<dynamic> dialogDeleteMethod(
      BuildContext context, Map<String, dynamic> horario) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Eliminar',
              style: GoogleFonts.anekTamil(
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
            content: Text(
              'Esta seguro que desea Eliminar?',
              style: GoogleFonts.anekTamil(
                  fontWeight: FontWeight.w300, fontSize: 18),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancelar',
                  style: GoogleFonts.acme(
                      fontSize: 17,
                      color: const Color.fromARGB(255, 23, 103, 168)),
                ),
              ),
              TextButton(
                onPressed: () {
                  print('Si eliminar ${horario['id']}');
                  DatabaseHelper.instance.deleteHorario(horario['id']);
                  onUpdate(true);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Horario Eliminado Correctamente.'),
                      backgroundColor: Color.fromARGB(255, 201, 69, 60),
                    ),
                  );
                },
                child: Text(
                  'Eliminar',
                  style: GoogleFonts.acme(
                      fontSize: 17,
                      color: const Color.fromARGB(255, 182, 50, 41)),
                ),
              ),
            ],
          );
        });
  }
}
