import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeCaching {
  const ThemeCaching._();
  static final Box _theme = Hive.box('theme');

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox('theme');
  }

  static String initialRadio() {
    switch (_theme.get('isLight')) {
      case true:
        return 'ThemeMode.light';
      case false:
        return 'ThemeMode.dark';
      default:
        return 'ThemeMode.system';
    }
  }

  static ThemeMode initialTheme() {
    switch (_theme.get('isLight')) {
      case true:
        return ThemeMode.light;
      case false:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  static void makelight() {
    _theme.put('isLight', true);
  }

  static void makeDark() {
    _theme.put('isLight', false);
  }

  static void makeSystem() {
    _theme.put('isLight', null);
  }
}
