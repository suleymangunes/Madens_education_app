import 'package:education_app_like_udemy/core/constants/icon/icon_constants.dart';
import 'package:education_app_like_udemy/core/constants/string/string_constants.dart';
import 'package:education_app_like_udemy/view/_product/screen-list/studen_screen_list.dart';
import 'package:education_app_like_udemy/view/student/home/view-model/bottom-navbar/bottom_nav_index_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavIndexCubit(),
      child: BlocBuilder<BottomNavIndexCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: StudentScreens().screens[state],
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
        context.read<BottomNavIndexCubit>().changeBottomIndex(value);
      },
      items: const [
        BottomNavigationBarItem(icon: IconConstants.home, label: StringConstants.home),
        BottomNavigationBarItem(icon: IconConstants.basket, label: StringConstants.basket),
        BottomNavigationBarItem(icon: IconConstants.person, label: StringConstants.person),
      ],
    );
  }
}
