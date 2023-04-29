import 'package:flutter/material.dart';

class HeadlineSmallText extends StatelessWidget {
  const HeadlineSmallText({super.key, this.textAlign, required this.text});

  final TextAlign? textAlign;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
