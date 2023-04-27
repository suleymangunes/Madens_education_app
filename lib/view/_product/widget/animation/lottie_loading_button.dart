import 'package:education_app_like_udemy/core/components/animation/lottie_animation.dart';
import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/product/enum/animation/animation_enum.dart';
import 'package:flutter/material.dart';

class LottieBigLoadingButton extends StatelessWidget {
  const LottieBigLoadingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LottieAnimation(
      height: context.bigTitleLottiSize,
      path: AnimationEnum.loading.toJson,
    );
  }
}
