import 'package:education_app_like_udemy/view/student/my-course/my-course-detail/service/my_course_detail_repository.dart';
import 'package:education_app_like_udemy/view/student/my-course/my-course-detail/view-model/my_course_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCourseDetailCubit extends Cubit<IMyCourseDetailState> {
  MyCourseDetailCubit() : super(MyCourseDetailInitialState());

  Future<void> getMyCourseDeatil(int id) async {
    try {
      emit(MyCourseDetailLoadingState());
      final response = await MyCourseDeatilRepository().getMyCourse(id: id);
      emit(MyCourseDetailCompletedState(response));
    } catch (e) {
      emit(MyCourseDetailErrorState(e.toString()));
    }
  }
}
