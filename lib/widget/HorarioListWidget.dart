import 'package:flutter/material.dart';
import 'package:flutter_horario2/data/database/database_helper.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/MateriaDetailScreen.dart';

class HorarioListWidget extends StatelessWidget {
  final MateriaDetailScreen widget;
  final int materiaId;
  final Function(bool) onUpdate;

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
                          Text('${horario['horaInicio']} ', style: GoogleFonts.abel()),
                          Text('${horario['horaFinal']}', style: GoogleFonts.abel()),
                          const Divider(),
                          Text('${horario['aula']}', style: GoogleFonts.abel(fontSize: 14))
                        ],
                      ),
                    )),
                    TableCell(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        IconButtonWidget(
                          icon: Icons.delete,
                          color: Color.fromARGB(255, 219, 73, 63),
                        ),
                        IconButtonWidget(
                          icon: Icons.edit,
                          color: Color.fromARGB(255, 67, 145, 70),
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
}

class IconButtonWidget extends StatelessWidget {
  final IconData icon;
  final Color color;

  const IconButtonWidget({
    super.key,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          print('Delete');
        },
        icon: Icon(
          icon,
          size: 25,
          color: color,
        ));
  }
}

class TableDataRow extends StatelessWidget {
  const TableDataRow({
    super.key,
    required this.horario,
    required this.text,
  });

  final Map<String, dynamic> horario;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TableCell(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Text(
        '${horario[text]}',
        style: GoogleFonts.abel(fontSize: 19, fontWeight: FontWeight.w400),
      )),
    ));
  }
}

class TableColumn extends StatelessWidget {
  final String text;

  const TableColumn({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TableCell(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.acme(fontSize: 15),
        ),
      ),
    ));
  }
}
