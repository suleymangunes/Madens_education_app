import 'package:education_app_like_udemy/view/teacher/home/view/teacher_home_view.dart';
import 'package:education_app_like_udemy/view/teacher/profile/teacher_profile.dart';
import 'package:flutter/material.dart';

class TeacherScreens {
  final List<Widget> screens = [
    const TeacherHomeView(),
    const TeacherProfile(),
  ];
}
