import 'package:flutter/material.dart';

class TextTitleMediumSlim extends StatelessWidget {
  const TextTitleMediumSlim({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w300,
            color: Theme.of(context).hintColor,
          ),
    );
  }
}
