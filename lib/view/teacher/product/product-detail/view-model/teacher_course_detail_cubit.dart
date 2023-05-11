import 'package:education_app_like_udemy/view/teacher/product/product-detail/service/teacher_course_detail_repository.dart';
import 'package:education_app_like_udemy/view/teacher/product/product-detail/view-model/teacher_course_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeahcerCourseDetailCubit extends Cubit<ITeacherCourseDetailState> {
  TeahcerCourseDetailCubit() : super(TeacherCourseDetailInitialState());

  Future<void> getTeacherCourse({required int courseId}) async {
    try {
      emit(TeacherCourseDetailLoadingState());
      var response = await TeacherCourseDeatilRepository().getTeacherCourse(id: courseId);
      emit(TeacherCourseDetailCompletedState(response));
    } catch (e) {
      emit(TeacherCourseDetailErrorState(e.toString()));
    }
  }
}
