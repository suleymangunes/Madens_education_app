import 'package:education_app_like_udemy/view/_product/enum/search/search_enum.dart';
import 'package:education_app_like_udemy/view/student/home/model/course_model.dart';
import 'package:education_app_like_udemy/view/student/home/view-model/course-cubit/get_course_state.dart';
import 'package:flutter/foundation.dart';

abstract class ISearchState {
  EnumSearch status;
  ISearchState({
    required this.status,
  });
}

class SearchInitialState extends ISearchState {
  SearchInitialState() : super(status: EnumSearch.initial);
}

class SearchLoadingState extends ISearchState {
  SearchLoadingState() : super(status: EnumSearch.loading);
}

class SearchCompletedState extends ISearchState {
  final List<Courses> responseList;
  SearchCompletedState(this.responseList) : super(status: EnumSearch.completed);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetCourseCompleted && listEquals(other.response, responseList);
  }

  @override
  int get hashCode => responseList.hashCode;
}

class SearchErrorState extends ISearchState {
  final String message;
  SearchErrorState(this.message) : super(status: EnumSearch.error);
}
