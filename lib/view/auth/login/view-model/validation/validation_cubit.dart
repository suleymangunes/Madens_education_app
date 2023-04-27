import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidateCubit extends Cubit<AutovalidateMode> {
  ValidateCubit() : super(AutovalidateMode.disabled);

  void validateMode() {
    emit(AutovalidateMode.onUserInteraction);
  }
}
