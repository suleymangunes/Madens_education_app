import 'package:education_app_like_udemy/view/student/search/service/search_repository.dart';
import 'package:education_app_like_udemy/view/student/search/view-model/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<ISearchState> {
  SearchCubit() : super(SearchInitialState());

  Future<void> search(String search) async {
    try {
      print("cubite giriyor");
      emit(SearchLoadingState());
      final response = await SearchRepository().searchCourses(search: search);
      print("hele bakalım buraya gelir mi");
      print(response);
      if (response == null) {
        emit(SearchErrorState("Aradığın şeye karşılık bir sonuç bulamadım"));
      } else {
        emit(SearchCompletedState(response));
      }
    } catch (e) {
      print("hata nedir $e");
      emit(SearchErrorState(e.toString()));
    }
  }
}
