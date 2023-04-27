import 'package:flutter/material.dart';

class TextTitleLarge extends StatelessWidget {
  const TextTitleLarge({super.key, required this.color, required this.text, this.spacing});
  final Color color;
  final String text;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: color,
            letterSpacing: spacing,
          ),
    );
  }
}
