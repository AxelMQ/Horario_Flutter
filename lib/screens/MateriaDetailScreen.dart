// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_horario2/data/models/materia.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../widget/HorarioListWidget.dart';
import '../widget/ModalHorarioAddWidget.dart';

class MateriaDetailScreen extends StatefulWidget {
  // final Map<String, dynamic> materia;
  final Materia materia;

  const MateriaDetailScreen({
    super.key, 
    required this.materia
  });

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
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AnimationWidget(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.materia.materia ?? '',
                      style: GoogleFonts.akshar(fontSize: 30),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Sigla: ${widget.materia.sigla ?? ''}',
                      style: GoogleFonts.archivo(
                          fontWeight: FontWeight.w200, fontSize: 20),
                    ),
                    Text(
                      'Grupo: ${widget.materia.grupo ?? ''}',
                      style: GoogleFonts.archivo(
                          fontWeight: FontWeight.w200, fontSize: 20),
                    ),
                    Text(
                      'Docente: ${widget.materia.docente ?? ''}',
                      style: GoogleFonts.archivo(
                          fontWeight: FontWeight.w200, fontSize: 20),
                    ),
                    Text(
                      'Semestre: ${widget.materia.semestre ?? ''}',
                      style: GoogleFonts.archivo(
                          fontWeight: FontWeight.w200, fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                HorarioListWidget(
                  widget: widget,
                  onUpdate: updateHorarioList,
                  materiaId: widget.materia.id!,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          elevation: 20,
          tooltip: 'Agregar Horario',
          child: const Icon(
            Icons.timer_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            showModalBottomSheet(
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
          },
        ));
  }
}

class AnimationWidget extends StatelessWidget {
  const AnimationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 150),
      child: ClipRRect(
        child: Lottie.asset('assets/information.json'),
      ),
    );
  }
}
