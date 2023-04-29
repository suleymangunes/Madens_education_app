import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginCaching {
  const LoginCaching._();

  static final Box _login = Hive.box('login');
  static final Box _token = Hive.box('token');
  static final Box _role = Hive.box('role');

  static Future<void> init() async {
    await Hive.openBox('login');
    await Hive.openBox('token');
    await Hive.openBox('role');
  }

  static String initialLogin() {
    switch (_login.get('isLogined')) {
      case true:
        if (_role.get('myRole') != null && _role.get('myRole') == "student") {
          return RouteEnum.studentHomePage.rawValue;
        } else {
          return RouteEnum.teacherHomePage.rawValue;
        }
      default:
        return RouteEnum.login.rawValue;
    }
  }

  static void signin() {
    _login.put('isLogined', true);
  }

  static void signout() {
    _login.put('isLogined', false);
  }

  static void setToken(String token) {
    _token.put('myToken', token);
  }

  static void changeRole(String role) {
    _role.put('myRole', role);
  }
}
