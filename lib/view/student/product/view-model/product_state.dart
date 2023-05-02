import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';
import 'package:education_app_like_udemy/view/student/product/model/product_model.dart';

abstract class IProductState {
  GetCourseEnum status;
  IProductState({
    required this.status,
  });
}

class ProductInitialState extends IProductState {
  ProductInitialState() : super(status: GetCourseEnum.initial);
}

class ProductLoadingState extends IProductState {
  ProductLoadingState() : super(status: GetCourseEnum.loading);
}

class ProductCompletedState extends IProductState {
  final ProductModel model;
  ProductCompletedState(this.model) : super(status: GetCourseEnum.completed);
}

class ProductErrorState extends IProductState {
  ProductErrorState() : super(status: GetCourseEnum.error);
}
