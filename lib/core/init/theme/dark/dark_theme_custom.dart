import 'package:education_app_like_udemy/core/init/theme/build-material-color/build_color.dart';
import 'package:education_app_like_udemy/core/init/theme/light/light_theme_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part '../../../constants/theme/dark_constants.dart';

class DarkThemeCustom {
  late ThemeData theme;

  DarkThemeCustom() {
    theme = ThemeData(
      //  CUSTOMIZE AREA
      brightness: Brightness.dark,
      primarySwatch: BuildColor().buildMaterialColor(LightThemeColors.scarlet),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: DarkThemeColors._appBarBackground,
          statusBarIconBrightness: Brightness.light,
        ),
        centerTitle: true,
      ),
    );
  }
}
