
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'AnimationRegisterWidget.dart';
import 'FormRegisterMateria.dart';

class BodyRegisterMateriaWidget extends StatelessWidget {
  const BodyRegisterMateriaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AnimationRegisterWidget(),
            Text(
              'REGISTRAR MATERIA',
              style: GoogleFonts.oswald(
                  textStyle: const TextStyle(
                      fontSize: 35, fontWeight: FontWeight.w500)),
            ),
            Text(
              'Agregue la informacion de la Materia',
              style: GoogleFonts.oswald(
                  textStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w200,
              )),
            ),
            const SizedBox(height: 15),
            const FormRegisterMateria(),
          ],
        ),
      ),
    );
  }
}