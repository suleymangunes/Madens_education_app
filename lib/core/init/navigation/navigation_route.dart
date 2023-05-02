import 'package:education_app_like_udemy/core/init/navigation/navigation_routers.dart';
import 'package:go_router/go_router.dart';

class NavigationRoute {
  static final GoRouter router = NavigationRouters.router;
  const NavigationRoute._();

  static void goRouteNormal(String route) {
    router.push(route);
  }

  static void goRouteClear(String route) {
    router.pushReplacement(route);
  }

  static void goRouteNormalWithParam(String route, String param) {
    router.pushNamed(route, params: {"key": param});
  }

  static void goRouteClearWithParam(String route, String param) {
    router.pushReplacementNamed(route, params: {"key": param});
  }

  static void goWithObject(String route, Object object) {
    router.pushNamed(route, extra: object);
  }

  static void goWithInt(String route, int integer) {
    router.pushNamed(route, extra: integer);
  }
}
