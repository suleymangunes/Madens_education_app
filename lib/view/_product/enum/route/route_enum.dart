enum RouteEnum {
  intro,
  setting,
  studentHomePage,
  login,
  register,
  userRole,
  teacherHomePage,
}

extension RouteEnumString on RouteEnum {
  String get rawValue {
    switch (this) {
      case RouteEnum.intro:
        return '/intro';
      case RouteEnum.setting:
        return '/setting';
      case RouteEnum.studentHomePage:
        return '/studentHomePage';
      case RouteEnum.login:
        return '/login';
      case RouteEnum.register:
        return '/register';
      case RouteEnum.userRole:
        return '/userRole';
      case RouteEnum.teacherHomePage:
        return '/teacherHomePage';
    }
  }
}
