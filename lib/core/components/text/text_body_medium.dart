import 'package:flutter/material.dart';

class TextBodyMedium extends StatelessWidget {
  const TextBodyMedium({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
