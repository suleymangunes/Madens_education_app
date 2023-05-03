import 'package:education_app_like_udemy/view/student/basket/view/basket_view.dart';
import 'package:education_app_like_udemy/view/student/home/view/home_view.dart';
import 'package:education_app_like_udemy/view/student/my-course/view/my_course_view.dart';
import 'package:education_app_like_udemy/view/student/profile/view/profile_view.dart';
import 'package:flutter/material.dart';

class StudentScreens {
  final List<Widget> screens = [
    const HomeView(),
    const BasketView(),
    const MyCourseView(),
    const ProfileView(),
  ];
}
