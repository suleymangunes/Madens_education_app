import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:flutter/material.dart';

class LisstileImage extends StatelessWidget {
  const LisstileImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          image,
          width: context.width * 0.25,
          height: context.width * 0.35,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.photo);
          },
        ),
      ),
    );
  }
}
