import 'package:education_app_like_udemy/core/components/text-button/text_button_medium.dart';
import 'package:education_app_like_udemy/core/constants/icon/icon_constants.dart';
import 'package:education_app_like_udemy/core/constants/string/string_constants.dart';
import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:flutter/material.dart';

class SuccessAlertDialog extends StatelessWidget {
  const SuccessAlertDialog(
      {super.key, required this.callback, required this.successTitle, required this.successMessage});

  final String successTitle;
  final String successMessage;
  final void Function() callback;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.only(top: 20, bottom: 10),
      contentPadding: const EdgeInsets.only(bottom: 10),
      title: Column(
        children: [
          IconConstants.done,
          context.normalSpace,
          Text(successTitle, textAlign: TextAlign.center),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(successMessage),
          TextButtonMedium(
            function: () {
              callback();
            },
            text: StringConstants.login,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
