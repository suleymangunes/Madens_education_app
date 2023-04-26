import 'package:education_app_like_udemy/view/_product/enum/login/login_enum.dart';

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
  ErrorLoginState() : super(status: LoginEnum.error);
}
