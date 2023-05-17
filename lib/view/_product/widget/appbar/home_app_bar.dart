import 'package:education_app_like_udemy/core/components/text/text_title_medium_slim.dart';
import 'package:education_app_like_udemy/core/constants/icon/icon_constants.dart';
import 'package:education_app_like_udemy/core/extension/border/border_extension.dart';
import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/core/extension/padding/padding_extension.dart';
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: _searchArea(context),
    );
  }

  SizedBox _searchArea(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      width: context.appBarWidth,
      child: Padding(
        padding: context.smallPadding,
        child: InkWell(
          onTap: () {
            NavigationRoute.goRouteNormal(RouteEnum.studentSearch.rawValue);
          },
          borderRadius: context.searchBorder,
          child: _enableTextfield(context),
        ),
      ),
    );
  }

  TextField _enableTextfield(BuildContext context) {
    return TextField(
      enabled: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: context.searchBorder),
        label: const TextTitleMediumSlim(text: "Search Something..."),
        suffixIcon: IconConstants.search,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
