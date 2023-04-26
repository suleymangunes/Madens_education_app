import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.obscureText,
      required this.label,
      required this.icon,
      required this.function});

  final TextEditingController controller;
  final bool obscureText;
  final String label;
  final Icon icon;
  final String? Function(String?) function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.textFieldWidht,
      child: TextFormField(
        scrollPadding: const EdgeInsets.only(bottom: 40),
        decoration: InputDecoration(
          prefixIcon: icon,
          border: const OutlineInputBorder(),
          label: Text(label),
        ),
        obscureText: obscureText,
        controller: controller,
        validator: function,
      ),
    );
  }
}
