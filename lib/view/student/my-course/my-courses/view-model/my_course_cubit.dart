import 'package:education_app_like_udemy/view/student/my-course/my-courses/service/my_course_repository.dart';
import 'package:education_app_like_udemy/view/student/my-course/my-courses/view-model/my_course_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCourseCubit extends Cubit<IMyCourseState> {
  MyCourseCubit() : super(MyCourseInitial());

  Future<void> getMyCourses() async {
    try {
      emit(MyCourseLoading());
      final response = await MyCourseRepository().getMyCourses();
      if (response != null) {
        emit(MyCourseCompleted(response));
      } else {
        emit(MyCourseError("Kursunuz bulunmamakta"));
      }
    } catch (e) {
      emit(MyCourseError(e.toString()));
    }
  }
}
