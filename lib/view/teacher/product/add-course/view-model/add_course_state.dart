abstract class IAddCourseState {}

class AddCourseInitialState extends IAddCourseState {
  AddCourseInitialState() : super();
}

class AddCourseLoadingState extends IAddCourseState {
  AddCourseLoadingState() : super();
}

class AddCourseCompletedState extends IAddCourseState {
  AddCourseCompletedState() : super();
}

class AddCourseErrorState extends IAddCourseState {
  AddCourseErrorState() : super();
}
