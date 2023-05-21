import 'package:education_app_like_udemy/view/teacher/add-course/model/add_course_model.dart';
import 'package:education_app_like_udemy/view/teacher/add-course/service/add_course_service.dart';
import 'package:education_app_like_udemy/view/teacher/add-course/view-model/add_course_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCourseCubit extends Cubit<IAddCourseState> {
  AddCourseCubit() : super(AddCourseInitialState());

  Future<void> addCourse({required AddCourseModel addCourseModel}) async {
    try {
      emit(AddCourseLoadingState());
      await AddCourseService().addCourse(addCourseModel: addCourseModel);
      emit(AddCourseCompletedState());
    } catch (e) {
      emit(AddCourseErrorState());
    }
  }
}
