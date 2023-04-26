import 'package:education_app_like_udemy/product/enum/icon/icon_enums.dart';
import 'package:flutter/material.dart';

class IconLogo extends StatelessWidget {
  const IconLogo({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(IconEnums.icon.toPng, height: height);
  }
}
