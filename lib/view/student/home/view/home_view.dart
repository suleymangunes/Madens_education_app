import 'package:education_app_like_udemy/product/widget/card/course_card.dart';
import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/_product/widget/animation/lottie_loading_button.dart';
import 'package:education_app_like_udemy/view/_product/widget/appbar/home_app_bar.dart';
import 'package:education_app_like_udemy/view/student/home/view-model/course-cubit/get_course_cubit.dart';
import 'package:education_app_like_udemy/view/student/home/view-model/course-cubit/get_course_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: BlocProvider(
        create: (context) => GetCoursesCubit()..getAllCourses(),
        child: BlocBuilder<GetCoursesCubit, IGetCourseState>(
          builder: (context, state) {
            switch (state.status) {
              case GetCourseEnum.initial:
                return const Text("Kurs Bulunamadı");
              case GetCourseEnum.loading:
                return const Center(child: LottieBigLoadingButton());
              case GetCourseEnum.completed:
                return _courseList(state as GetCourseCompleted);
              case GetCourseEnum.error:
                return const Text("Hata olustu");
            }
          },
        ),
      ),
    );
  }

  ListView _courseList(GetCourseCompleted data) {
    return ListView.builder(
      itemCount: data.response.length,
      itemBuilder: (context, index) {
        final courseData = data.response[index];
        // TODO bu kısmı duzenle ve dizayni guzellestir
        return CourseCard(
          path: RouteEnum.productDetail.rawValue,
          id: courseData.courseID,
          courseName: courseData.courseName.toString(),
          courseDescription: courseData.courseDescription.toString(),
          price: courseData.coursePrice.toString(),
          date: courseData.createdDate.toString(),
          imageurl: courseData.imageUrl.toString(),
          teacherName: courseData.teacherName.toString(),
        );
      },
    );
  }
}
