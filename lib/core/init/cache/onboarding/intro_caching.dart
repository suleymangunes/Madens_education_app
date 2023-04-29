import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:hive_flutter/hive_flutter.dart';

class IntroCaching {
  const IntroCaching._();

  static final Box _intro = Hive.box('intro');
  static final Box _login = Hive.box('login');
  static final Box _role = Hive.box('role');

  static Future<void> init() async {
    await Hive.openBox('intro');
  }

  static String initialIntro() {
    switch (_intro.get('introWatched')) {
      case true:
        if (_login.get('isLogined') != null && _login.get('isLogined') == true) {
          if (_role.get('myRole') != null && _role.get('myRole') == "student") {
            return RouteEnum.studentHomePage.rawValue;
          } else {
            return RouteEnum.teacherHomePage.rawValue;
          }
        } else {
          return RouteEnum.userRole.rawValue;
        }
      default:
        return RouteEnum.intro.rawValue;
    }
  }

  static void watchIntro() {
    _intro.put('introWatched', true);
  }
}
