import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:flutter/material.dart';

class LisstileImage extends StatelessWidget {
  const LisstileImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.listtileImageSize,
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
