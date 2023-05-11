import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';
import 'package:education_app_like_udemy/view/student/basket/model/basket_model.dart';
import 'package:flutter/foundation.dart';

abstract class ITeacherCoursesState {
  GetCourseEnum status;
  ITeacherCoursesState({
    required this.status,
  });
}

class TeacherCoursesInitialState extends ITeacherCoursesState {
  TeacherCoursesInitialState() : super(status: GetCourseEnum.initial);
}

class TeacherCoursesLoadingState extends ITeacherCoursesState {
  TeacherCoursesLoadingState() : super(status: GetCourseEnum.loading);
}

class TeacherCoursesCompletedState extends ITeacherCoursesState {
  final List<Courses> response;
  TeacherCoursesCompletedState(this.response) : super(status: GetCourseEnum.completed);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TeacherCoursesCompletedState && listEquals(other.response, response);
  }

  @override
  int get hashCode => response.hashCode;
}

class TeacherCoursesErrorState extends ITeacherCoursesState {
  final String message;
  TeacherCoursesErrorState(this.message) : super(status: GetCourseEnum.error);
}
