import 'package:education_app_like_udemy/core/init/cache/theme/theme_caching.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeCaching.initialTheme());

  void makelight() {
    ThemeCaching.makelight();
    emit(ThemeMode.light);
  }

  void makeDark() {
    ThemeCaching.makeDark();
    emit(ThemeMode.dark);
  }

  void makeSystem() {
    ThemeCaching.makeSystem();
    emit(ThemeMode.system);
  }
}
