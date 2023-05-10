import 'package:education_app_like_udemy/view/student/product/product-detail/model/product_model.dart';
import 'package:education_app_like_udemy/view/student/product/product-detail/service/product_repository.dart';
import 'package:education_app_like_udemy/view/student/product/product-detail/view-model/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailCubit extends Cubit<IProductState> {
  ProductDetailCubit() : super(ProductInitialState());

  Future<void> getProduct({required id}) async {
    try {
      emit(ProductLoadingState());
      print("hata burada");
      final ProductModel model = await ProductRepository().getCourse(id: id);
      print("peki ya burada ");
      emit(ProductCompletedState(model));
    } catch (e) {
      emit(ProductErrorState());
    }
  }
}
