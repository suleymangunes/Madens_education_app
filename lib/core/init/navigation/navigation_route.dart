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
}
