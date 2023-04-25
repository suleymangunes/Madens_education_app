import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part '../../../constants/theme/dark_constants.dart';

class DarkThemeCustom {
  late ThemeData theme;

  DarkThemeCustom() {
    theme = ThemeData(
      //  CUSTOMIZE AREA
      brightness: Brightness.dark,
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
