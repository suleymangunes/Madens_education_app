import 'package:flutter/material.dart';

class TextButtonMedium extends StatelessWidget {
  const TextButtonMedium({super.key, required this.function, required this.text, required this.color});

  final void Function()? function;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: color,
            ),
      ),
    );
  }
}
