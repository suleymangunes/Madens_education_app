import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextMediumTitle extends StatelessWidget {
  const TextMediumTitle({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr(),
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
