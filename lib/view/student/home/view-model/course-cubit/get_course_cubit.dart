import 'package:education_app_like_udemy/view/student/home/model/course_model.dart';
import 'package:education_app_like_udemy/view/student/home/service/course_repository.dart';
import 'package:education_app_like_udemy/view/student/home/view-model/course-cubit/get_course_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCoursesCubit extends Cubit<IGetCourseState> {
  GetCoursesCubit() : super(GetCourseInitialState());

  void getAllCourses() async {
    try {
      emit(GetCourseLoadingState());
      final List<Courses> response = await CourseRepository().getAllCourses();
      emit(GetCourseCompleted(response: response));
    } catch (e) {
      emit(GetCourseErrorState(e.toString()));
    }
  }
}
