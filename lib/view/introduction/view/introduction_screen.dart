import 'package:education_app_like_udemy/core/components/dots/dots_decoration.dart';
import 'package:education_app_like_udemy/core/components/text/text_with_theme_color.dart';
import 'package:education_app_like_udemy/core/init/cache/onboarding/intro_caching.dart';
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/product/init/lang/locale_keys.g.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/introduction/view-model/intro_pages.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introduction {
  const Introduction._();
  static final intro = IntroductionScreen(
    pages: IntroPages.pageList,
    showSkipButton: true,
    showNextButton: false,
    skip: const TextMediumTitle(text: LocaleKeys.buttonSkip),
    done: const TextMediumTitle(text: LocaleKeys.buttonDone),
    onDone: () {
      IntroCaching.watchIntro();
      NavigationRoute.goRouteClear(RouteEnum.login.rawValue);
    },
    dotsDecorator: DotsDecoration.decoration,
  );
}
