// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/FormRegisterMateria.dart';
import 'package:lottie/lottie.dart';

class RegisterMateriaScreen extends StatelessWidget {
  const RegisterMateriaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Materia'),
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(maxHeight: 200),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Lottie.asset('assets/registerForm.json'),
                ),
              ),
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
      ),
    );
  }
}
