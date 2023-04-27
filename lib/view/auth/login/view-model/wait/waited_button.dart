import 'package:flutter_bloc/flutter_bloc.dart';

class WaitedLoginCubit extends Cubit<bool> {
  WaitedLoginCubit() : super(false);

  void readOnlyTrue() {
    emit(true);
  }

  void readOnlyFalse() {
    emit(false);
  }
}
