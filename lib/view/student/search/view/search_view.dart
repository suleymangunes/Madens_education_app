// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/_product/enum/search/search_enum.dart';
import 'package:education_app_like_udemy/view/_product/widget/animation/lottie_loading_button.dart';
import 'package:education_app_like_udemy/view/student/home/view/home_view.dart';
import 'package:education_app_like_udemy/view/student/search/view-model/search_cubit.dart';
import 'package:education_app_like_udemy/view/student/search/view-model/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(),
      child: BlocBuilder<SearchCubit, ISearchState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: TextField(
                enabled: _ableField(state),
                autofocus: true,
                controller: _searchController,
              ),
              actions: [
                IconButton(
                  onPressed: state is SearchLoadingState
                      ? null
                      : () {
                          if (_searchController.text.isNotEmpty) {
                            context.read<SearchCubit>().search(_searchController.text);
                          }
                        },
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            body: BlocBuilder<SearchCubit, ISearchState>(
              builder: (context, state) {
                switch (state.status) {
                  case EnumSearch.initial:
                    return const Center(child: Text("Bir şeyler yaz ve arama ikonuna bas."));
                  case EnumSearch.loading:
                    return const Center(child: LottieBigLoadingButton());
                  case EnumSearch.completed:
                    return _responseList(state as SearchCompletedState);
                  case EnumSearch.error:
                    return const Center(child: Text("Aradığın şeyi bulamadık. Duzgun sey ara."));
                }
              },
            ),
          );
        },
      ),
    );
  }

  ListView _responseList(SearchCompletedState response) {
    return ListView.builder(
      itemCount: response.responseList.length,
      itemBuilder: (BuildContext context, int index) {
        var data = response.responseList[index];
        return CourseCard(
          path: RouteEnum.productDetail.rawValue,
          id: data.courseID,
          courseName: data.courseName.toString(),
          courseDescription: data.courseDescription.toString(),
          price: data.coursePrice.toString(),
          date: data.createdDate.toString(),
          imageurl: data.imageUrl.toString(),
          teacherName: data.teacherName.toString(),
        );
      },
    );
  }

  bool _ableField(ISearchState state) => state is SearchLoadingState ? false : true;
}
