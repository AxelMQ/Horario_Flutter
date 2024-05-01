// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_horario2/screens/RegisterMateriaScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonAgregar extends StatelessWidget {
  final VoidCallback onUpdate;
  const ButtonAgregar({
    super.key,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor:
            const MaterialStatePropertyAll(Color.fromARGB(255, 22, 83, 27)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Agregar',
            style: GoogleFonts.asul(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 5),
          const Icon(
            Icons.add_circle_outlined,
            color: Colors.white,
          )
        ],
      ),
      onPressed: () {
        // print('add Materia');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    RegisterMateriaScreen(onUpdate: onUpdate)));
      },
    );
  }
}
