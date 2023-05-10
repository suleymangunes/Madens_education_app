import 'package:education_app_like_udemy/core/components/image/listtile_image.dart';
import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/_product/widget/animation/lottie_loading_button.dart';
import 'package:education_app_like_udemy/view/student/home/view-model/course-cubit/get_course_cubit.dart';
import 'package:education_app_like_udemy/view/student/home/view-model/course-cubit/get_course_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO bu kismi duzenle ve yeniden dizaynla
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: IconButton(
          onPressed: () {
            NavigationRoute.goRouteNormal(RouteEnum.studentSearch.rawValue);
          },
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
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

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.courseName,
    required this.courseDescription,
    required this.price,
    required this.date,
    required this.imageurl,
    required this.id,
    required this.teacherName,
    this.path,
  });
  final String courseName;
  final String courseDescription;
  final String price;
  final String date;
  final String imageurl;
  final String teacherName;
  final int? id;
  final String? path;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: context.lowValue, vertical: context.lowValue),
      child: InkWell(
        onTap: () {
          NavigationRoute.goWithInt(path as String, id as int);
        },
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courseName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                courseDescription,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(teacherName),
              Text(price),
              Text(date),
            ],
          ),
          trailing: LisstileImage(
            image: "https://10.0.2.2:7278$imageurl",
          ),
        ),
      ),
    );
  }
}
