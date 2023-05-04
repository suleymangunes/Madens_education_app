import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';
import 'package:education_app_like_udemy/view/student/basket/model/basket_model.dart';
import 'package:flutter/foundation.dart';

abstract class IMyCourseState {
  GetCourseEnum status;
  IMyCourseState({required this.status});
}

class MyCourseInitial extends IMyCourseState {
  MyCourseInitial() : super(status: GetCourseEnum.initial);
}

class MyCourseLoading extends IMyCourseState {
  MyCourseLoading() : super(status: GetCourseEnum.loading);
}

class MyCourseCompleted extends IMyCourseState {
  final List<BasketModel> response;
  MyCourseCompleted(this.response) : super(status: GetCourseEnum.completed);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MyCourseCompleted && listEquals(other.response, response);
  }

  @override
  int get hashCode => response.hashCode;
}

class MyCourseError extends IMyCourseState {
  final String message;
  MyCourseError(this.message) : super(status: GetCourseEnum.error);
}
