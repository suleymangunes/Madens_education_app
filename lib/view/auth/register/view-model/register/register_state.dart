import 'package:education_app_like_udemy/view/_product/enum/register/register_enum.dart';
import 'package:education_app_like_udemy/view/auth/register/model/register_response_model.dart';

abstract class IRegisterState {
  final RegisterEnum status;
  IRegisterState({
    required this.status,
  });
}

class InitialRegisterState extends IRegisterState {
  InitialRegisterState() : super(status: RegisterEnum.initial);
}

class LoadingRegisterState extends IRegisterState {
  LoadingRegisterState() : super(status: RegisterEnum.loading);
}

class CompletedRegisterState extends IRegisterState {
  CompletedRegisterState() : super(status: RegisterEnum.completed);
}

class ErrorRegisterState extends IRegisterState {
  final RegisterResponseModel? errorMessage;
  ErrorRegisterState({required this.errorMessage}) : super(status: RegisterEnum.error);
}
