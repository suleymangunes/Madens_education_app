import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';
import 'package:education_app_like_udemy/view/student/home/model/course_model.dart';
import 'package:flutter/foundation.dart';

abstract class IGetCourseState {
  GetCourseEnum status;
  IGetCourseState({
    required this.status,
  });
}

class GetCourseInitialState extends IGetCourseState {
  GetCourseInitialState() : super(status: GetCourseEnum.initial);
}

class GetCourseLoadingState extends IGetCourseState {
  GetCourseLoadingState() : super(status: GetCourseEnum.loading);
}

class GetCourseCompleted extends IGetCourseState {
  final List<Courses> response;
  GetCourseCompleted({required this.response}) : super(status: GetCourseEnum.completed);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetCourseCompleted && listEquals(other.response, response);
  }

  @override
  int get hashCode => response.hashCode;
}

class GetCourseErrorState extends IGetCourseState {
  final String message;
  GetCourseErrorState(this.message) : super(status: GetCourseEnum.error);
}
