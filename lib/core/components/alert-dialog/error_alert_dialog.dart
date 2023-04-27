import 'package:education_app_like_udemy/core/components/text-button/text_button_medium.dart';
import 'package:education_app_like_udemy/core/constants/string/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorAlertDialogGoBack extends StatelessWidget {
  const ErrorAlertDialogGoBack({super.key, required this.errorMessage, required this.errorTitle});

  final String errorTitle;
  final String errorMessage;

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
              GoRouter.of(context).pop();
            },
            text: StringConstants.tryAgain,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
