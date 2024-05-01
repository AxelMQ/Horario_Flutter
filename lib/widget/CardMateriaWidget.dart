import 'package:flutter/material.dart';
import 'package:flutter_horario2/data/database/database_helper.dart';
import 'package:flutter_horario2/data/models/materia.dart';
import 'package:flutter_horario2/screens/MateriaDetailScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CardMateriaWidget extends StatelessWidget {
  const CardMateriaWidget({
    super.key,
    required this.materia,
    required this.onUpdate,
  });

  // final Map<String, dynamic> materia;
  final Materia materia;
  final VoidCallback onUpdate;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        materia.materia ?? '',
        style: GoogleFonts.akshar(fontSize: 20),
      ),
      subtitle: Text(
        'Sigla: ${materia.sigla ?? ''} - Grupo: ${materia.grupo ?? ''} - Docente: ${materia.docente ?? ''} - SEM: ${materia.semestre ?? ''}',
        style: GoogleFonts.archivo(fontWeight: FontWeight.w200, fontSize: 14),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Color.fromARGB(255, 240, 126, 126),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Eliminar Materia',
                        style: GoogleFonts.anekTamil(
                            fontWeight: FontWeight.w600, fontSize: 30),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Estas seguro de que deseas eliminar esta materia?',
                            style: GoogleFonts.anekTamil(
                                fontWeight: FontWeight.w300, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '${materia.materia} - ${materia.sigla} ${materia.grupo}',
                            style: GoogleFonts.anekTelugu(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ],
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
                            DatabaseHelper.instance
                                .deleteMateria(materia.id!);
                            Navigator.of(context).pop();
                            messageAnimation(context);
                            onUpdate();
                          },
                          child: Text(
                            'Eliminar',
                            style: GoogleFonts.acme(
                                fontSize: 17,
                                color: const Color.fromARGB(255, 182, 50, 41)),
                          ),
                        )
                      ],
                    );
                  });
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.info,
              color: Color.fromARGB(255, 126, 135, 139),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MateriaDetailScreen(materia: materia)));
            },
          )
        ],
      ),
    );
  }

  Future<dynamic> messageAnimation(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Materia Eliminada Exitosamente!!!',
              style: GoogleFonts.anekTamil(
                  fontWeight: FontWeight.w400, fontSize: 18),
            ),
            content: SizedBox(
              child:
                  Lottie.asset('assets/deleteConfirm.json', fit: BoxFit.cover),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                      child: Text(
                    'Aceptar',
                    style: GoogleFonts.acme(fontSize: 20, color: Colors.black),
                  )))
            ],
          );
        });
  }
}
