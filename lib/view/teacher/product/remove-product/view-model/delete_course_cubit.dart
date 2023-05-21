import 'package:education_app_like_udemy/view/teacher/product/remove-product/service/delete_course_service.dart';
import 'package:education_app_like_udemy/view/teacher/product/remove-product/view-model/delete_course_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteCourseCubit extends Cubit<IDeleteCourseState> {
  DeleteCourseCubit() : super(DeleteCourseInitialState());

  Future<void> deleteCourse(int id) async {
    try {
      emit(DeleteCourseLodingState());
      await DeleteCourseService().deleteCourseById(id);
      emit(DeleteCourseCompletedState());
    } catch (e) {
      emit(DeleteCourseErrorState());
    }
  }
}
