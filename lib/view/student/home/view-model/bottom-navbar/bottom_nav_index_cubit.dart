import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavIndexCubit extends Cubit<int> {
  BottomNavIndexCubit() : super(0);

  void changeBottomIndex(int index) {
    emit(index);
  }
}
