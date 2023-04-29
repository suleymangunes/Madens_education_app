import 'package:education_app_like_udemy/core/components/text-form-field/custom_text_field_register.dart';
import 'package:education_app_like_udemy/core/constants/icon/icon_constants.dart';
import 'package:education_app_like_udemy/core/constants/string/string_constants.dart';
import 'package:education_app_like_udemy/core/extension/validator/password_validator.dart';
import 'package:flutter/material.dart';

class CustomTextFieldPasswordRegister extends StatelessWidget {
  const CustomTextFieldPasswordRegister({super.key, required this.passwordController, this.passwordAgainController});
  final TextEditingController passwordController;
  final TextEditingController? passwordAgainController;
  @override
  Widget build(BuildContext context) {
    return CustomTextFieldForRegister(
        controller: passwordController,
        obscureText: true,
        label: StringConstants.password,
        icon: IconConstants.password,
        function: (value) {
          if (value != null && value.isValidPassword()) {
            return null;
          } else if (passwordAgainController != null && passwordAgainController?.text != passwordController.text) {
            return StringConstants.passwordAgain;
          }
          return StringConstants.validPasswordRegex;
        });
  }
}
