// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../widget/RegisterMateriaScreen/BodyRegisterMateriaWidget.dart';

class RegisterMateriaScreen extends StatelessWidget {
  final VoidCallback onUpdate;

  const RegisterMateriaScreen({super.key, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Materia'),
        elevation: 0.5,
      ),
      body: BodyRegisterMateriaWidget(onUpdate: onUpdate),
    );
  }
}
