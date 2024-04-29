import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TableDataRow extends StatelessWidget {
  const TableDataRow({
    super.key,
    required this.horario,
    required this.text,
  });

  final Map<String, dynamic> horario;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TableCell(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Text(
        '${horario[text]}',
        style: GoogleFonts.abel(fontSize: 19, fontWeight: FontWeight.w400),
      )),
    ));
  }
}