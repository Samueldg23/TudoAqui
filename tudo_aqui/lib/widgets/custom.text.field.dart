import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;

  const CustomTextField({
    required this.label,
    required this.hint,
    this.obscureText = false,
    required this.controller,
    this.validator,
    this.labelStyle,
    this.textStyle,
    this.hintStyle,
    this.keyboardType, 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: textStyle ?? const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: labelStyle,
        hintStyle: hintStyle ?? const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
      validator: validator,
    );
  }
}



/*
exemplo de como usar

final _emailController = TextEditingController();

CustomTextField(
  label: "Email",
  hint: "Digite seu email",
  controller: _emailController,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return "Email é obrigatório";
    }
    if (!Validators.validarEmail(value)) {
      return "Email inválido";
    }
    return null;
  },
);
*/