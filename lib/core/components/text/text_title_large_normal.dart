import 'package:flutter/material.dart';

class TextTitleLarge extends StatelessWidget {
  const TextTitleLarge({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
