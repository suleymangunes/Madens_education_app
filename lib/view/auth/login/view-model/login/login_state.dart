import 'package:education_app_like_udemy/view/_product/enum/login/login_enum.dart';
import 'package:education_app_like_udemy/view/auth/login/model/login_response_model.dart';

abstract class ILoginState {
  final LoginEnum status;
  ILoginState({
    required this.status,
  });
}

class InitialLoginState extends ILoginState {
  InitialLoginState() : super(status: LoginEnum.initial);
}

class LoadingLoginState extends ILoginState {
  LoadingLoginState() : super(status: LoginEnum.loading);
}

class CompletedLoginState extends ILoginState {
  CompletedLoginState() : super(status: LoginEnum.completed);
}

class ErrorLoginState extends ILoginState {
  final LoginResponseModel? errorMessage;
  ErrorLoginState({required this.errorMessage}) : super(status: LoginEnum.error);
}
