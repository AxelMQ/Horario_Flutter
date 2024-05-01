// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_horario2/data/models/materia.dart';

import '../widget/MateriaDetailScreen/Horario/HorarioListWidget.dart';
import '../widget/MateriaDetailScreen/AnimationWidget.dart';
import '../widget/MateriaDetailScreen/DetailMateriaWidget.dart';
import '../widget/MateriaDetailScreen/Horario/ModalHorarioAddWidget.dart';

class MateriaDetailScreen extends StatefulWidget {
  // final Map<String, dynamic> materia;
  final Materia materia;

  const MateriaDetailScreen({super.key, required this.materia});

  @override
  State<MateriaDetailScreen> createState() => _MateriaDetailScreenState();
}

class _MateriaDetailScreenState extends State<MateriaDetailScreen> {
  bool _horariosActualizados = false;
  void updateHorarioList(bool updated) {
    setState(() {
      _horariosActualizados = updated;
      print('ACTUALIZAR HORARIOS: $_horariosActualizados');
      print('Valor de updated: $updated');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Informacion de la Materia'),
        ),
        resizeToAvoidBottomInset: true,
        body: body(),
        floatingActionButton: floationgActionButton(context));
  }

  Padding body() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AnimationWidget(),
            DetailMateriaWidget(materia: widget.materia),
            const SizedBox(height: 30),
            HorarioListWidget(
              widget: widget,
              onUpdate: updateHorarioList,
              materiaId: widget.materia.id!,
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton floationgActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blueGrey,
      elevation: 20,
      tooltip: 'Agregar Horario',
      child: const Icon(
        Icons.timer_sharp,
        color: Colors.white,
      ),
      onPressed: () {
        modalBottomHorarioAdd(context);
      },
    );
  }

  Future<dynamic> modalBottomHorarioAdd(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
              child: ModalHorarioAddWidget(
            materia: widget.materia,
            onUpdate: updateHorarioList,
          )),
        );
      },
      useRootNavigator: true,
    );
  }
}
