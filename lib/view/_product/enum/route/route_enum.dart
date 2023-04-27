enum RouteEnum {
  intro,
  setting,
  homePage,
  login,
  register,
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
      case RouteEnum.login:
        return '/login';
      case RouteEnum.register:
        return '/register';
    }
  }
}
