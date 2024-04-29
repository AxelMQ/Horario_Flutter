
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormTextWidget extends StatelessWidget {
  final String text;
  final TextEditingController? controllerForm;
  final TextInputType? keyword;
  final String? Function(String?)? onValidator;
  final bool? textObscure;
  final bool convertToUpperCase;

  const FormTextWidget({
    super.key,
    required this.text,
    this.controllerForm,
    this.keyword,
    this.onValidator,
    this.textObscure, 
    this.convertToUpperCase = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerForm,
      validator: onValidator,
      keyboardType: keyword,
      onChanged: (text) {
        if (convertToUpperCase) {
          controllerForm?.text = text.toUpperCase();
          controllerForm?.selection = TextSelection.fromPosition(
            TextPosition(offset: controllerForm!.text.length),
          );
        }
      },
      decoration: InputDecoration(
        labelText: text,
        labelStyle: GoogleFonts.smoochSans(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 0, 0, 0), width: 1.5),
            borderRadius: BorderRadius.circular(13.0)),
      ),
    );
  }
}
