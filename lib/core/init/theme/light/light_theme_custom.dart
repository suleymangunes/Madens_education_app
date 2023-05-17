import 'package:education_app_like_udemy/core/init/theme/build-material-color/build_color.dart';
import 'package:education_app_like_udemy/core/init/theme/commons/color_commons.dart';
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
        iconTheme: IconThemeData(
          color: Colors.black54,
        ),
        backgroundColor: ColorCommons.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: LightThemeColors.scarlet,
          statusBarIconBrightness: Brightness.dark,
        ),
        centerTitle: true,
      ),
    );
  }
}
