import 'package:education_app_like_udemy/core/components/text/text_title_large.dart';
import 'package:flutter/material.dart';

class TestTitleLargeWithSpacing extends StatelessWidget {
  const TestTitleLargeWithSpacing({super.key, required this.color, required this.text, required this.spacing});

  final Color color;
  final String text;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return TextTitleLarge(
      color: color,
      text: text,
      spacing: spacing,
    );
  }
}
