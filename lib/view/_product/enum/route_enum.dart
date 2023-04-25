enum RouteEnum {
  intro,
  setting,
  homePage,
}

extension RouteEnumString on RouteEnum {
  String get rawValue {
    switch (this) {
      case RouteEnum.intro:
        return '/intro';
      case RouteEnum.setting:
        return '/setting';
      case RouteEnum.homePage:
        return '/homePage';
    }
  }
}
