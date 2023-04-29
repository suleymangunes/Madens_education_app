import 'package:education_app_like_udemy/core/components/text-button/text_button_medium.dart';
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:flutter/material.dart';

class TextButtonMediumNavigateGoNormalParam extends StatelessWidget {
  const TextButtonMediumNavigateGoNormalParam(
      {super.key, required this.path, required this.text, required this.wait, required this.param});
  final String path;
  final String text;
  final bool wait;
  final String param;

  @override
  Widget build(BuildContext context) {
    return TextButtonMedium(
      function: wait == false
          ? () {
              NavigationRoute.goRouteNormalWithParam(RouteEnum.register.rawValue, param);
            }
          : null,
      text: text,
      color: Colors.black,
    );
  }
}
