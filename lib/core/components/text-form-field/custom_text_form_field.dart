import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/view/auth/login/view-model/wait/waited_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextFieldForLoading extends StatelessWidget {
  const CustomTextFieldForLoading(
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
      child: BlocBuilder<WaitedLoginCubit, bool>(
        builder: (context, state) {
          return TextFormField(
            readOnly: state,
            scrollPadding: const EdgeInsets.only(bottom: 40),
            decoration: InputDecoration(
              prefixIcon: icon,
              border: const OutlineInputBorder(),
              label: Text(label),
            ),
            obscureText: obscureText,
            controller: controller,
            validator: function,
          );
        },
      ),
    );
  }
}
