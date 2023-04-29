import 'dart:io';
import 'package:education_app_like_udemy/app.dart';
import 'package:education_app_like_udemy/core/init/cache/login/login_caching.dart';
import 'package:education_app_like_udemy/core/init/cache/onboarding/intro_caching.dart';
import 'package:education_app_like_udemy/core/init/cubit/theme_cubit.dart';
import 'package:education_app_like_udemy/core/init/cache/theme/theme_caching.dart';
import 'package:education_app_like_udemy/core/init/localization/project_locales.dart';
import 'package:education_app_like_udemy/cubit_observer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:education_app_like_udemy/product/init/service/service_overrides.dart';
import 'package:education_app_like_udemy/view/auth/login/view-model/wait/waited_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'core/init/localization/localization.dart';

Future<void> main() async {
  await LocaleVariables._init();
  await ThemeCaching.init();
  await IntroCaching.init();
  await LoginCaching.init();
  Bloc.observer = CubitObserver();
  HttpOverrides.global = MyHttpOverrides();

  runApp(
    EasyLocalization(
      supportedLocales: LocaleVariables._localesList,
      path: LocaleVariables._localesPath,
      fallbackLocale: LocaleVariables._fallBackLocale,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(create: (context) => WaitedLoginCubit()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}
