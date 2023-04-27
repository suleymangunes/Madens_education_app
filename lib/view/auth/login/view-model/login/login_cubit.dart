import 'package:education_app_like_udemy/view/auth/login/service/login_service.dart';
import 'package:education_app_like_udemy/view/auth/login/view-model/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<ILoginState> {
  LoginCubit() : super(InitialLoginState());

  Future<void> login({required String email, required String password}) async {
    try {
      emit(LoadingLoginState());
      var response = await LoginService(email: email, password: password).login();
      if (response.data == null) {
        emit(ErrorLoginState(errorMessage: response));
      } else {
        emit(CompletedLoginState());
      }
    } catch (e) {
      emit(ErrorLoginState(errorMessage: null));
    }
  }
}
