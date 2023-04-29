import 'package:education_app_like_udemy/core/components/text-form-field/custom_text_field_register.dart';
import 'package:education_app_like_udemy/core/constants/icon/icon_constants.dart';
import 'package:education_app_like_udemy/core/constants/string/string_constants.dart';
import 'package:education_app_like_udemy/core/extension/validator/email_validator.dart';
import 'package:flutter/material.dart';

class CustomTextFieldEmailRegister extends StatelessWidget {
  const CustomTextFieldEmailRegister({super.key, required this.emailController});
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFieldForRegister(
      controller: emailController,
      obscureText: false,
      label: StringConstants.email,
      icon: IconConstants.email,
      function: (value) => (value != null && value.isValidEmail()) ? null : StringConstants.validEmail,
    );
  }
}
