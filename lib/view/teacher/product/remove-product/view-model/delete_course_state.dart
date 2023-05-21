abstract class IDeleteCourseState {}

class DeleteCourseInitialState extends IDeleteCourseState {}

class DeleteCourseLodingState extends IDeleteCourseState {}

class DeleteCourseCompletedState extends IDeleteCourseState {}

class DeleteCourseErrorState extends IDeleteCourseState {}
