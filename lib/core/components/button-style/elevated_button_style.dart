import 'package:flutter/material.dart';

class ElevatedButtonStyle {
  final double circularSize;
  const ElevatedButtonStyle({
    required this.circularSize,
  });
  ButtonStyle get style => ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularSize),
          ),
        ),
      );
}
