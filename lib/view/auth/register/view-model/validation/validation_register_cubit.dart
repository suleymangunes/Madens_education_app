import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidateRegisterCubit extends Cubit<AutovalidateMode> {
  ValidateRegisterCubit() : super(AutovalidateMode.disabled);

  void validateMode() {
    emit(AutovalidateMode.onUserInteraction);
  }
}
