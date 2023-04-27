import 'package:education_app_like_udemy/core/components/text-form-field/custom_text_form_field.dart';
import 'package:education_app_like_udemy/core/constants/icon/icon_constants.dart';
import 'package:education_app_like_udemy/core/constants/string/string_constants.dart';
import 'package:flutter/material.dart';

class CustomTextFieldPassword extends StatelessWidget {
  const CustomTextFieldPassword({super.key, required this.passwordController});
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFieldForLoading(
      controller: passwordController,
      obscureText: true,
      label: StringConstants.password,
      icon: IconConstants.password,
      function: (value) {
        if (value == null || value.isEmpty) {
          return StringConstants.validPassword;
        }
        return null;
      },
    );
  }
}
