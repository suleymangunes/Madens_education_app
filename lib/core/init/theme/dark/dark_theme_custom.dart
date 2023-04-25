import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part '../../../constants/theme/dark_constants.dart';

class DarkThemeCustom {
  late ThemeData theme;

  DarkThemeCustom() {
    theme = ThemeData.dark().copyWith(
      //  CUSTOMIZE AREA
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: DarkThemeColors._appBarBackground,
          statusBarIconBrightness: Brightness.light,
        ),
        centerTitle: true,
        color: DarkThemeColors._appBarBackground,
        titleTextStyle: TextStyle(
          color: Colors.white,
        ),
        iconTheme: IconThemeData(),
      ),
      iconTheme: const IconThemeData(
        color: DarkThemeIcon._iconColor,
      ),
    );
  }
}
