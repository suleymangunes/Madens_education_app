import 'package:education_app_like_udemy/view/student/basket/model/basket_model.dart';
import 'package:education_app_like_udemy/view/teacher/home/service/teacher_repository.dart';
import 'package:education_app_like_udemy/view/teacher/home/view-model/course/teacher_courses_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeacherCoursesCubit extends Cubit<ITeacherCoursesState> {
  TeacherCoursesCubit() : super(TeacherCoursesInitialState());

  Future<void> getMyCourses() async {
    try {
      emit(TeacherCoursesLoadingState());
      List<Courses> response = await TeacherRepository().getAllCourses();
      // List<Courses> response = [];
      if (response.isNotEmpty) {
        emit(TeacherCoursesCompletedState(response));
      } else {
        emit(TeacherCoursesErrorState('kurs bulunamadi'));
      }
    } catch (e) {
      emit(TeacherCoursesErrorState(e.toString()));
    }
  }
}
