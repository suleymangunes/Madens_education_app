import 'package:education_app_like_udemy/view/teacher/product/curriculum/model/curriculum_model.dart';
import 'package:education_app_like_udemy/view/teacher/product/curriculum/service/curriculum_service.dart';
import 'package:education_app_like_udemy/view/teacher/product/curriculum/view-model/add_curriculum_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCurriculumCubit extends Cubit<IAddCurriculumState> {
  AddCurriculumCubit() : super(AddCurriculumInitialState());

  Future<void> addCurriculum(CurriculumModel model) async {
    try {
      emit(AddCurriculumLoadingState());
      await CirruculumService().addCirruculum(model);
      emit(AddCurriculumCompletedState());
    } catch (e) {
      emit(AddCurriculumErrorState());
    }
  }
}
