import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatelessWidget {
  const LottieAnimation({super.key, required this.height, required this.path});

  final double height;
  final String path;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Lottie.asset(path),
    );
  }
}
