import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:flutter/material.dart';

class CardDescriptionText extends StatelessWidget {
  const CardDescriptionText({super.key, required this.courseDescription});
  final String courseDescription;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.cardTitleArea,
      child: Text(
        courseDescription,
        style: Theme.of(context).textTheme.titleMedium,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
