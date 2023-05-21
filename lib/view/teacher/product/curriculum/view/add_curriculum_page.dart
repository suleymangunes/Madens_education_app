import 'package:education_app_like_udemy/view/teacher/product/curriculum/view-model/add_curriculum_cubit.dart';
import 'package:education_app_like_udemy/view/teacher/product/curriculum/view/add_cirruculum_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCurriculumPage extends StatelessWidget {
  const AddCurriculumPage({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddCurriculumCubit()),
      ],
      child: AddCurriculumView(id: id),
    );
  }
}
