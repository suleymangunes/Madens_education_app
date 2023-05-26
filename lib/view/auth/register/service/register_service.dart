import 'dart:convert';
import 'package:education_app_like_udemy/product/constants/api/api_constants.dart';
import 'package:education_app_like_udemy/product/enum/api/api_service.dart';
import 'package:education_app_like_udemy/view/auth/register/model/register_model.dart';
import 'package:education_app_like_udemy/view/auth/register/model/register_response_model.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  late final RegisterModel _registerModel;
  final String email;
  final String password;

  RegisterService({required this.email, required this.password}) {
    _registerModel = RegisterModel(email: email, password: password, confirmPassword: password);
  }

  Future<RegisterResponseModel> registerTeacher() async {
    var response = await http.post(
      Uri.parse(ApiService.accountregister.pathValue),
      headers: ApiConstants.headerJson,
      body: jsonEncode(
        _registerModel.toJson(),
      ),
    );
    final json = jsonDecode(response.body);
    return RegisterResponseModel.fromJson(json);
  }

  Future<RegisterResponseModel> registerStudent() async {
    var response = await http.post(
      Uri.parse(ApiService.studentRegister.pathValue),
      headers: ApiConstants.headerJson,
      body: jsonEncode(
        _registerModel.toJson(),
      ),
    );
    final json = jsonDecode(response.body);
    return RegisterResponseModel.fromJson(json);
  }
}
