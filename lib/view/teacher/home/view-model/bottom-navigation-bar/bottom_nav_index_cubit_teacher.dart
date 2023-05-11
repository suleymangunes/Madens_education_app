import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavIndexCubitTeacher extends Cubit<int> {
  BottomNavIndexCubitTeacher() : super(0);

  void changeBottomIndex(int index) {
    emit(index);
  }
}
