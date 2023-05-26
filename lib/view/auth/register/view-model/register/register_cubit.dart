import 'package:education_app_like_udemy/core/constants/string/string_constants.dart';
import 'package:education_app_like_udemy/view/auth/register/service/register_service.dart';
import 'package:education_app_like_udemy/view/auth/register/view-model/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<IRegisterState> {
  RegisterCubit() : super(InitialRegisterState());

  Future<void> register({required String email, required String password, required String role}) async {
    try {
      emit(LoadingRegisterState());
      if (role == StringConstants.teacher) {
        var response = await RegisterService(email: email, password: password).registerTeacher();
        if (response.success == true) {
          emit(CompletedRegisterState());
        } else {
          emit(ErrorRegisterState(errorMessage: response));
        }
      } else if (role == StringConstants.student) {
        var response = await RegisterService(email: email, password: password).registerStudent();
        if (response.success == true) {
          emit(CompletedRegisterState());
        } else {
          emit(ErrorRegisterState(errorMessage: response));
        }
      }
    } catch (e) {
      emit(ErrorRegisterState(errorMessage: null));
    }
  }
}
