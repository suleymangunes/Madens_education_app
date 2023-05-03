import 'package:education_app_like_udemy/view/student/product/add-basket/model-view/basket_state.dart';
import 'package:education_app_like_udemy/view/student/product/add-basket/service/basket_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBasketCubit extends Cubit<IBasketState> {
  AddBasketCubit() : super(BasketInitialState());

  Future<void> addToBasket(int? courseId) async {
    try {
      emit(BasketLoadingState());
      if (courseId != null) {
        await BasketRepository().adToBasket(courseId);

        emit(BasketCompletedState());
      } else {
        emit(BasketErrorState("course id is null"));
      }
    } catch (e) {
      emit(BasketErrorState(e.toString()));
    }
  }
}
