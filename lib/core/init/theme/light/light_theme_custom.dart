import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part '../../../constants/theme/light_constants.dart';

class LightThemeCustom {
  late ThemeData theme;

  LightThemeCustom() {
    theme = ThemeData.light().copyWith(
      //  CUSTOMIZE AREA
      primaryColor: LightThemeColors._primaryColor,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: LightThemeColors._appBarBackground,
          statusBarIconBrightness: Brightness.dark,
        ),
        centerTitle: true,
        color: LightThemeColors._appBarBackground,
        titleTextStyle: TextStyle(
          color: Colors.black,
        ),
        iconTheme: IconThemeData(),
      ),
      iconTheme: const IconThemeData(
        color: LightThemeIcon._iconColor,
      ),
    );
  }
}
