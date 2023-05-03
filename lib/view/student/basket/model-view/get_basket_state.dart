import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';
import 'package:education_app_like_udemy/view/student/basket/model/basket_model.dart';
import 'package:flutter/foundation.dart';

abstract class IGetBasketState {
  GetCourseEnum status;
  IGetBasketState({
    required this.status,
  });
}

class GetBasketInitial extends IGetBasketState {
  GetBasketInitial() : super(status: GetCourseEnum.initial);
}

class GetBasketLoading extends IGetBasketState {
  GetBasketLoading() : super(status: GetCourseEnum.loading);
}

class GetBasketCompleted extends IGetBasketState {
  final List<BasketModel> basketList;
  GetBasketCompleted(this.basketList) : super(status: GetCourseEnum.completed);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetBasketCompleted && listEquals(other.basketList, basketList);
  }

  @override
  int get hashCode => basketList.hashCode;
}

class GetBasketError extends IGetBasketState {
  final String message;
  GetBasketError(this.message) : super(status: GetCourseEnum.error);
}
