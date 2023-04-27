import 'package:education_app_like_udemy/core/components/text-button/text_button_medium.dart';
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:flutter/material.dart';

class TextButtonMediumNavigateGoClear extends StatelessWidget {
  const TextButtonMediumNavigateGoClear({super.key, required this.path, required this.text});
  final String path;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButtonMedium(
      function: () {
        NavigationRoute.goRouteClear(path);
      },
      text: text,
      color: Colors.black,
    );
  }
}
