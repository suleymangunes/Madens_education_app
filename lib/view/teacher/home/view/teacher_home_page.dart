import 'package:education_app_like_udemy/core/constants/icon/icon_constants.dart';
import 'package:education_app_like_udemy/core/constants/string/string_constants.dart';
import 'package:education_app_like_udemy/view/_product/screen-list/teacher/teacher_screen_list.dart';
import 'package:education_app_like_udemy/view/teacher/home/view-model/bottom_nav_index_cubit_teacher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeacherHomePage extends StatelessWidget {
  const TeacherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavIndexCubitTeacher(),
      child: BlocBuilder<BottomNavIndexCubitTeacher, int>(
        builder: (context, state) {
          return Scaffold(
            body: TeacherScreens().screens[state],
            bottomNavigationBar: _bottomNavBar(state, context),
          );
        },
      ),
    );
  }

  BottomNavigationBar _bottomNavBar(int state, BuildContext context) {
    return BottomNavigationBar(
      currentIndex: state,
      onTap: (value) {
        context.read<BottomNavIndexCubitTeacher>().changeBottomIndex(value);
      },
      items: const [
        BottomNavigationBarItem(icon: IconConstants.home, label: StringConstants.home),
        BottomNavigationBarItem(icon: IconConstants.person, label: StringConstants.person),
      ],
    );
  }
}
