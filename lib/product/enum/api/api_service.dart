enum ApiService {
  accountLogin,
  accountregister,
  studentLogin,
  studentRegister,
}

extension PathExtension on ApiService {
  static String baseUrl = "https://10.0.2.2:7278";
  String get pathValue {
    switch (this) {
      case ApiService.accountLogin:
        return "$baseUrl/api/Account/login";
      case ApiService.accountregister:
        return "$baseUrl/api/Account/register";
      case ApiService.studentRegister:
        return "$baseUrl/api/AuthStudent/register";
      case ApiService.studentLogin:
        return "$baseUrl/api/AuthStudent/login";
    }
  }
}
