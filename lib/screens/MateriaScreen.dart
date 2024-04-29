// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_horario2/data/database/database_helper.dart';

import '../widget/CardMateriaWidget.dart';

class MateriaScreen extends StatefulWidget {
  const MateriaScreen({super.key});

  @override
  State<MateriaScreen> createState() => _MateriaScreenState();
}

class _MateriaScreenState extends State<MateriaScreen> {
  void updateMateria() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materias Registradas'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseHelper.instance.getMaterias(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData){
            List<Map<String, dynamic>> materias = snapshot.data!;
            if (materias.isEmpty) {
              return const Center(
                child: Text(
                  'No hay materias registradas.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200
                  ),
                ),
              );
            }  else {
            return ListView.builder(
              itemCount: materias.length,
              itemBuilder: (context, index) {
                final materia = materias[index];
                return CardMateriaWidget(
                  materia: materia, 
                  onUpdate: updateMateria,
                );
              },
            );
          }
        } else {
          return const SizedBox();
        }
        }
      ),
    );
  }
}
