import 'package:education_app_like_udemy/view/auth/register/service/register_service.dart';
import 'package:education_app_like_udemy/view/auth/register/view-model/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<IRegisterState> {
  RegisterCubit() : super(InitialRegisterState());

  Future<void> register({required String email, required String password}) async {
    try {
      emit(LoadingRegisterState());
      var response = await RegisterService(email: email, password: password).register();
      print(response);
      print(response.success);
      print(response.data);
      print(response.message);

      if (response.success == true) {
        emit(CompletedRegisterState());
      } else {
        emit(ErrorRegisterState(errorMessage: response));
      }
    } catch (e) {
      emit(ErrorRegisterState(errorMessage: null));
    }
  }
}
