import 'package:education_app_like_udemy/core/components/icon/icon_logo.dart';
import 'package:education_app_like_udemy/core/components/text/headline_small_text.dart';
import 'package:education_app_like_udemy/core/components/text/title_medium_text.dart';
import 'package:education_app_like_udemy/core/constants/string/string_constants.dart';
import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:flutter/material.dart';

class UserRole extends StatelessWidget {
  const UserRole({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconLogo(height: context.logoValue),
            context.bigSpace,
            const HeadlineSmallText(text: StringConstants.welcomeApp),
            context.mediumSpace,
            const TitleMediumText(text: StringConstants.welcomeApp),
            context.largeSpace,
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    NavigationRoute.goRouteNormalWithParam(RouteEnum.login.rawValue, "student");
                  },
                  child: const Text(StringConstants.istudent),
                ),
                context.smallSpace,
                ElevatedButton(
                  onPressed: () {
                    NavigationRoute.goRouteNormalWithParam(RouteEnum.login.rawValue, "teacher");
                  },
                  child: const Text(StringConstants.iteacher),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
