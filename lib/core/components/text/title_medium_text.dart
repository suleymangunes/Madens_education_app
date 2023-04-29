import 'package:flutter/material.dart';

class TitleMediumText extends StatelessWidget {
  const TitleMediumText({super.key, this.textAlign, required this.text});

  final TextAlign? textAlign;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
