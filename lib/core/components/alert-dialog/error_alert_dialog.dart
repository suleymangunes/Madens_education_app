import 'package:education_app_like_udemy/core/components/text-button/text_button_medium.dart';
import 'package:education_app_like_udemy/core/constants/string/string_constants.dart';
import 'package:flutter/material.dart';

class ErrorAlertDialog extends StatelessWidget {
  const ErrorAlertDialog({super.key, required this.errorMessage, required this.errorTitle, required this.callback});

  final String errorTitle;
  final String errorMessage;
  final void Function() callback;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.only(top: 20, bottom: 10),
      contentPadding: const EdgeInsets.only(bottom: 10),
      title: Text(errorTitle, textAlign: TextAlign.center),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(errorMessage),
          TextButtonMedium(
            function: () {
              callback();
            },
            text: StringConstants.tryAgain,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
