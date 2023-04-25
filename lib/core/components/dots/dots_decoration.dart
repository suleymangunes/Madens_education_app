import 'package:education_app_like_udemy/core/constants/onboarding/intro_constants.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class DotsDecoration {
  const DotsDecoration._();
  static final decoration = DotsDecorator(
    size: IntroConstants.dotSquare,
    activeSize: IntroConstants.dotSize,
    spacing: IntroConstants.dotSpacing,
    activeShape: RoundedRectangleBorder(borderRadius: IntroConstants.dotsBorderCircular),
  );
}
