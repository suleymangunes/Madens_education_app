import 'package:education_app_like_udemy/core/init/cache/onboarding/intro_caching.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/auth/register/view/register_page.dart';
import 'package:education_app_like_udemy/view/home/view/home_page.dart';
import 'package:education_app_like_udemy/view/auth/introduction/view/introduction_screen.dart';
import 'package:education_app_like_udemy/view/auth/login/view/login_page.dart';
import 'package:education_app_like_udemy/view/settings/view/setting_view.dart';
import 'package:go_router/go_router.dart';

class NavigationRouters {
  const NavigationRouters._();

  static final GoRouter router = GoRouter(
    initialLocation: IntroCaching.initialIntro(),
    routes: [
      GoRoute(
        path: RouteEnum.intro.rawValue,
        builder: (context, state) => Introduction.intro,
      ),
      GoRoute(
        path: RouteEnum.login.rawValue,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: RouteEnum.register.rawValue,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: RouteEnum.homePage.rawValue,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: RouteEnum.setting.rawValue,
        builder: (context, state) => const SettingView(),
      ),
    ],
  );
}
