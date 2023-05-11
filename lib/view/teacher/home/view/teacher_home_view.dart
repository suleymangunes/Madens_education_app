import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/_product/widget/animation/lottie_loading_button.dart';
import 'package:education_app_like_udemy/view/student/basket/model/basket_model.dart';
import 'package:education_app_like_udemy/view/student/home/view/home_view.dart';
import 'package:education_app_like_udemy/view/teacher/home/view-model/course/teacher_courses_cubit.dart';
import 'package:education_app_like_udemy/view/teacher/home/view-model/course/teacher_courses_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';

class TeacherHomeView extends StatelessWidget {
  const TeacherHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TeacherCoursesCubit()..getMyCourses(),
      child: BlocBuilder<TeacherCoursesCubit, ITeacherCoursesState>(
        builder: (context, state) {
          switch (state.status) {
            case GetCourseEnum.initial:
              return const Text("Kurs Bulunamadı");
            case GetCourseEnum.loading:
              return const Center(child: LottieBigLoadingButton());
            case GetCourseEnum.completed:
              return TacherCourseListBuilder(response: state as TeacherCoursesCompletedState);
            case GetCourseEnum.error:
              return const Text("Hata olustu");
          }
        },
      ),
    );
  }
}

class TacherCourseListBuilder extends StatelessWidget {
  const TacherCourseListBuilder({super.key, required this.response});
  final TeacherCoursesCompletedState response;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: response.response.length,
      itemBuilder: (BuildContext context, int index) {
        final Courses model = response.response[index];
        return CourseCard(
          courseName: model.courseName.toString(),
          courseDescription: model.courseDescription.toString(),
          price: model.coursePrice.toString(),
          date: model.createdDate.toString(),
          imageurl: model.imageUrl.toString(),
          id: model.courseID,
          teacherName: model.teacherName.toString(),
          path: RouteEnum.teacherCourseDetailPage.rawValue,
        );
      },
    );
  }
}
