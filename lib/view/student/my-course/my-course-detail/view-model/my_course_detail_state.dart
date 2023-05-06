import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';
import 'package:education_app_like_udemy/view/student/product/product-detail/model/product_model.dart';

abstract class IMyCourseDetailState {
  GetCourseEnum status;
  IMyCourseDetailState({
    required this.status,
  });
}

class MyCourseDetailInitialState extends IMyCourseDetailState {
  MyCourseDetailInitialState() : super(status: GetCourseEnum.initial);
}

class MyCourseDetailLoadingState extends IMyCourseDetailState {
  MyCourseDetailLoadingState() : super(status: GetCourseEnum.loading);
}

class MyCourseDetailCompletedState extends IMyCourseDetailState {
  final ProductModel response;
  MyCourseDetailCompletedState(this.response) : super(status: GetCourseEnum.completed);
}

class MyCourseDetailErrorState extends IMyCourseDetailState {
  final String message;
  MyCourseDetailErrorState(this.message) : super(status: GetCourseEnum.error);
}
