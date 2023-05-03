import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';

abstract class IBasketState {
  GetCourseEnum status;
  IBasketState({
    required this.status,
  });
}

class BasketInitialState extends IBasketState {
  BasketInitialState() : super(status: GetCourseEnum.initial);
}

class BasketLoadingState extends IBasketState {
  BasketLoadingState() : super(status: GetCourseEnum.loading);
}

class BasketCompletedState extends IBasketState {
  BasketCompletedState() : super(status: GetCourseEnum.completed);
}

class BasketErrorState extends IBasketState {
  final String message;
  BasketErrorState(this.message) : super(status: GetCourseEnum.error);
}
