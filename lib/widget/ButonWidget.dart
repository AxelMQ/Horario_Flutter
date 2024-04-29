
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final FontWeight textWeight;
  final Color buttonColor;
  final Function()? onTap;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.textColor,
    required this.textWeight,
    required this.buttonColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.black),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.exo(
          textStyle: TextStyle(
            fontSize: 20,
            color: textColor,
            fontWeight: textWeight,
          )
        ),
      ),
    );
  }
}
