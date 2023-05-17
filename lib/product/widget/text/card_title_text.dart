import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:flutter/material.dart';

class CardTitleText extends StatelessWidget {
  const CardTitleText({super.key, required this.courseName});
  final String courseName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.cardTitleArea,
      child: Text(
        courseName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
