enum RouteEnum {
  intro,
  setting,
  studentHomePage,
  login,
  register,
  userRole,
  teacherHomePage,
  studentSearch,
  productDetail,
  payment,
  myCourseDetail,
  videoPage,
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
      case RouteEnum.studentSearch:
        return '/studentHomepage/studentSearch';
      case RouteEnum.productDetail:
        return '/productDetail';
      case RouteEnum.payment:
        return '/payment';
      case RouteEnum.myCourseDetail:
        return '/myCourseDetail';
      case RouteEnum.videoPage:
        return '/videoPage';
    }
  }
}
