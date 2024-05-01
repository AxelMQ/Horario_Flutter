import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionButtonWidget extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final Function()? function;

  const ActionButtonWidget({
    super.key,
    required this.text,
    required this.size,
    required this.color,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(text, style: GoogleFonts.acme(fontSize: size, color: color)),
    );
  }
}
