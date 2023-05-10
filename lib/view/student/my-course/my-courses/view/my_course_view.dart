import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/student/home/view/home_view.dart';
import 'package:education_app_like_udemy/view/student/my-course/my-courses/view-model/my_course_cubit.dart';
import 'package:education_app_like_udemy/view/student/my-course/my-courses/view-model/my_course_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';

class MyCourseView extends StatelessWidget {
  const MyCourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Course"),
      ),
      body: BlocProvider(
        create: (context) => MyCourseCubit()..getMyCourses(),
        child: BlocBuilder<MyCourseCubit, IMyCourseState>(
          builder: (context, state) {
            switch (state.status) {
              case GetCourseEnum.initial:
                return const Text("this is initial");
              case GetCourseEnum.loading:
                return const Text("this is loading");
              case GetCourseEnum.completed:
                return MycCourseListBuilder(response: state as MyCourseCompleted);
              case GetCourseEnum.error:
                return const Text("this is error");
            }
          },
        ),
      ),
    );
  }
}

class MycCourseListBuilder extends StatelessWidget {
  const MycCourseListBuilder({super.key, required this.response});
  final MyCourseCompleted response;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: response.response.length,
      itemBuilder: (BuildContext context, int index) {
        final model = response.response[index];
        // return Text(model.courseName.toString());

        return CourseCard(
          courseName: model.courseName.toString(),
          courseDescription: model.courseDescription.toString(),
          price: model.coursePrice.toString(),
          date: model.createdDate.toString(),
          imageurl: model.imageUrl.toString(),
          id: model.courseID,
          teacherName: model.teacherName.toString(),
          path: RouteEnum.myCourseDetail.rawValue,
        );
      },
    );
  }
}
