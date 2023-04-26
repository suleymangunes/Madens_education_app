enum ApiService {
  accountLogin,
}

extension PathExtension on ApiService {
  static String baseUrl = "https://10.0.2.2:7278";
  String get pathValue {
    switch (this) {
      case ApiService.accountLogin:
        return "$baseUrl/api/Account/login";
    }
  }
}
