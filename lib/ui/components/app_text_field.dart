import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    // required this.controller,
    required this.labelText,
    required this.icon,
  }) : super(key: key);

  // final TextEditingController controller;
  final String labelText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      maxLines: 1,
      // controller: controller,
      decoration: InputDecoration(
          hintText: labelText,
          prefixIcon: Icon(icon),
          hintStyle: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          )),
    );
  }

  String? validator(String? value) {
    if (value?.isEmpty == true) {
      return "Обязательное поле";
    }
    return null;
  }
}
