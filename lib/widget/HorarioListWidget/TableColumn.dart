import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TableColumn extends StatelessWidget {
  final String text;

  const TableColumn({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TableCell(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.acme(fontSize: 15),
        ),
      ),
    ));
  }
}
