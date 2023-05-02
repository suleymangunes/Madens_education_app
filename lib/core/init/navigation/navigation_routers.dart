import 'package:education_app_like_udemy/core/init/cache/onboarding/intro_caching.dart';
import 'package:education_app_like_udemy/product/constants/routing/routing_keys.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/auth/register/view/register_page.dart';
import 'package:education_app_like_udemy/view/auth/user-role/view/user_role_view.dart';
import 'package:education_app_like_udemy/view/student/home/view/student_home_page.dart';
import 'package:education_app_like_udemy/view/auth/introduction/view/introduction_screen.dart';
import 'package:education_app_like_udemy/view/auth/login/view/login_page.dart';
import 'package:education_app_like_udemy/view/settings/view/setting_view.dart';
import 'package:education_app_like_udemy/view/student/search/view/search_view.dart';
import 'package:education_app_like_udemy/view/teacher/home/view/teacher_home_page.dart';
import 'package:go_router/go_router.dart';

class NavigationRouters {
  const NavigationRouters._();

  static final GoRouter router = GoRouter(
    initialLocation: IntroCaching.initialIntro(),
    navigatorKey: RoutingKeys.rootNavigatorKey,
    routes: [
      GoRoute(
        path: RouteEnum.intro.rawValue,
        builder: (context, state) => Introduction.intro,
      ),
      GoRoute(
        path: RouteEnum.userRole.rawValue,
        builder: (context, state) => const UserRole(),
      ),
      GoRoute(
        path: "${RouteEnum.login.rawValue}/:key",
        name: RouteEnum.login.rawValue,
        builder: (context, state) => LoginPage(
          role: state.params["key"] ?? "null",
        ),
      ),
      GoRoute(
        path: "${RouteEnum.register.rawValue}/:key",
        name: RouteEnum.register.rawValue,
        builder: (context, state) => RegisterPage(
          role: state.params["key"] ?? "null",
        ),
      ),
      GoRoute(
        path: RouteEnum.studentHomePage.rawValue,
        builder: (context, state) => const StudentHomePage(),
      ),
      GoRoute(
        path: RouteEnum.teacherHomePage.rawValue,
        builder: (context, state) => const TeacherHomePage(),
      ),
      GoRoute(
        path: RouteEnum.setting.rawValue,
        builder: (context, state) => const SettingView(),
      ),
      GoRoute(
        path: RouteEnum.studentSearch.rawValue,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
