import 'dart:convert';
import 'package:education_app_like_udemy/product/constants/api/api_constants.dart';
import 'package:education_app_like_udemy/product/enum/api/api_service.dart';
import 'package:education_app_like_udemy/view/auth/login/model/login_model.dart';
import 'package:education_app_like_udemy/view/auth/login/model/login_response_model.dart';
import 'package:http/http.dart' as http;

class LoginService {
  late final LoginModel _loginModel;
  final String email;
  final String password;

  LoginService({required this.email, required this.password}) {
    _loginModel = LoginModel(email: email, password: password);
  }

  Future<LoginResponseModel> login() async {
    await Future.delayed(const Duration(seconds: 5));
    var response = await http.post(
      Uri.parse(ApiService.accountLogin.pathValue),
      headers: ApiConstants.headerJson,
      body: jsonEncode(
        _loginModel.toJson(),
      ),
    );
    final json = jsonDecode(response.body);
    return LoginResponseModel.fromJson(json);
  }
}
