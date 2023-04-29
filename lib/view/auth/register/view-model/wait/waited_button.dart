import 'package:flutter_bloc/flutter_bloc.dart';

class WaitedRegisterCubit extends Cubit<bool> {
  WaitedRegisterCubit() : super(false);

  void readOnlyTrue() {
    emit(true);
  }

  void readOnlyFalse() {
    emit(false);
  }
}
