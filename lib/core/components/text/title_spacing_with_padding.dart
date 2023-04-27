import 'package:education_app_like_udemy/core/components/text/text_large_with_spacing.dart';
import 'package:education_app_like_udemy/core/extension/padding/padding_extension.dart';
import 'package:education_app_like_udemy/core/extension/text/text_extension.dart';
import 'package:flutter/material.dart';

class TitleSpacingWithPadding extends StatelessWidget {
  const TitleSpacingWithPadding({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.buttonTitlePadding),
      child: TestTitleLargeWithSpacing(
        color: Colors.white,
        text: text,
        spacing: context.buttonTitleSpacing,
      ),
    );
  }
}
