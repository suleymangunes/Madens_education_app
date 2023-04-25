import 'package:education_app_like_udemy/core/init/theme/build-material-color/build_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part '../../../constants/theme/light_constants.dart';

class LightThemeCustom {
  late ThemeData theme;

  LightThemeCustom() {
    theme = ThemeData(
      //  CUSTOMIZE AREAss
      brightness: Brightness.light,
      primarySwatch: BuildColor().buildMaterialColor(LightThemeColors.scarlet),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: LightThemeColors.scarlet,
          statusBarIconBrightness: Brightness.dark,
        ),
        centerTitle: true,
      ),
    );
  }
}
