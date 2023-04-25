import 'package:education_app_like_udemy/view/_product/enum/route_enum.dart';
import 'package:hive_flutter/hive_flutter.dart';

class IntroCaching {
  const IntroCaching._();

  static final Box _intro = Hive.box('intro');

  static Future<void> init() async {
    await Hive.openBox('intro');
  }

  static String initialIntro() {
    switch (_intro.get('introWatched')) {
      case true:
        return RouteEnum.setting.rawValue;
      default:
        return RouteEnum.intro.rawValue;
    }
  }

  static void watchIntro() {
    _intro.put('introWatched', true);
  }
}
