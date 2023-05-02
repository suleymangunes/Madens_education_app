import 'package:education_app_like_udemy/view/student/product/model/product_model.dart';
import 'package:education_app_like_udemy/view/student/product/service/product_repository.dart';
import 'package:education_app_like_udemy/view/student/product/view-model/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailCubit extends Cubit<IProductState> {
  ProductDetailCubit() : super(ProductInitialState());

  Future<void> getProduct({required id}) async {
    try {
      emit(ProductLoadingState());
      final ProductModel model = await ProductRepository().getCourse(id: id);
      emit(ProductCompletedState(model));
    } catch (e) {
      emit(ProductErrorState());
    }
  }
}
