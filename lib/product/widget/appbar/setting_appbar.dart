import 'package:easy_localization/easy_localization.dart';
import 'package:education_app_like_udemy/product/init/lang/locale_keys.g.dart';
import 'package:flutter/material.dart';

class SettingAppbar extends StatelessWidget with PreferredSizeWidget {
  const SettingAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        LocaleKeys.settingTitle.tr(),
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
