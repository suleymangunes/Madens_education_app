import 'package:education_app_like_udemy/core/init/cache/login/login_caching.dart';
import 'package:education_app_like_udemy/view/auth/login/service/login_service.dart';
import 'package:education_app_like_udemy/view/auth/login/view-model/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<ILoginState> {
  LoginCubit() : super(InitialLoginState());

  Future<void> login({required String email, required String password, required role}) async {
    try {
      emit(LoadingLoginState());
      if (role == "teacher") {
        var response = await LoginService(email: email, password: password).loginTeacher();
        if (response.data == null) {
          emit(ErrorLoginState(errorMessage: response));
        } else {
          LoginCaching.changeRole(role);
          emit(CompletedLoginState(tokenData: response));
        }
      } else if (role == "student") {
        var response = await LoginService(email: email, password: password).loginStudent();
        if (response.data == null) {
          emit(ErrorLoginState(errorMessage: response));
        } else {
          LoginCaching.changeRole(role);
          emit(CompletedLoginState(tokenData: response));
        }
      }
    } catch (e) {
      emit(ErrorLoginState(errorMessage: null));
    }
  }
}
