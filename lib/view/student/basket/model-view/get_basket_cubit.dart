import 'package:education_app_like_udemy/view/student/basket/model-view/get_basket_state.dart';
import 'package:education_app_like_udemy/view/student/basket/service/get_basket_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetBasketCubit extends Cubit<IGetBasketState> {
  GetBasketCubit() : super(GetBasketInitial());

  Future<void> getBasket() async {
    try {
      emit(GetBasketLoading());
      print("sepete hic gelmiyor");
      final response = await GetBasketRepository().getBasket();

      print("sepete gelirken hata olusuyor");

      if (response != null) {
        emit(GetBasketCompleted(response));
      } else {
        emit(GetBasketError("sepetinizde ürün bulunmamaktadır"));
      }
    } catch (e) {
      emit(GetBasketError(e.toString()));
    }
  }
}
