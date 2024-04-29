import 'package:flutter/material.dart';
import 'package:flutter_horario2/data/database/database_helper.dart';

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
            // onUpdate(true);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: horarios.map((horario) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Día: ${horario['dia']}'),
                    Text('Hora Inicio: ${horario['horaInicio']}'),
                    Text('Hora Final: ${horario['horaFinal']}'),
                    Text('Aula: ${horario['aula']}'),
                    const Divider(),
                  ],
                );
              }).toList(),
            );
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
