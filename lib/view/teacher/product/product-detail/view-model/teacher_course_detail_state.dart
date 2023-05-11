import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';
import 'package:education_app_like_udemy/view/teacher/product/product-detail/model/teacher_product_model.dart';

abstract class ITeacherCourseDetailState {
  GetCourseEnum status;
  ITeacherCourseDetailState({
    required this.status,
  });
}

class TeacherCourseDetailInitialState extends ITeacherCourseDetailState {
  TeacherCourseDetailInitialState() : super(status: GetCourseEnum.initial);
}

class TeacherCourseDetailLoadingState extends ITeacherCourseDetailState {
  TeacherCourseDetailLoadingState() : super(status: GetCourseEnum.loading);
}

class TeacherCourseDetailCompletedState extends ITeacherCourseDetailState {
  final TeacherProductModel response;
  TeacherCourseDetailCompletedState(this.response) : super(status: GetCourseEnum.completed);
}

class TeacherCourseDetailErrorState extends ITeacherCourseDetailState {
  final String message;
  TeacherCourseDetailErrorState(this.message) : super(status: GetCourseEnum.error);
}
