import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/materia.dart';
import 'EditButtonWidget.dart';

class DetailMateriaWidget extends StatelessWidget {
  const DetailMateriaWidget({
    super.key,
    required this.materia,
  });

  final Materia materia;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                materia.materia ?? '',
                style: GoogleFonts.akshar(fontSize: 30),
                overflow: TextOverflow.visible,
              ),
            ),
            EditButtonWidget(
              materia: materia,
            )
          ],
        ),
        const SizedBox(height: 10),
        Text(
          'Sigla: ${materia.sigla ?? ''}',
          style: GoogleFonts.archivo(fontWeight: FontWeight.w200, fontSize: 20),
        ),
        Text(
          'Grupo: ${materia.grupo ?? ''}',
          style: GoogleFonts.archivo(fontWeight: FontWeight.w200, fontSize: 20),
        ),
        Text(
          'Docente: ${materia.docente ?? ''}',
          style: GoogleFonts.archivo(fontWeight: FontWeight.w200, fontSize: 20),
        ),
        Text(
          'Semestre: ${materia.semestre ?? ''}',
          style: GoogleFonts.archivo(fontWeight: FontWeight.w200, fontSize: 20),
        ),
      ],
    );
  }
}
