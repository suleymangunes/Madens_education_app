// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/teacher/product/product-detail/model/teacher_product_model.dart';
import 'package:education_app_like_udemy/view/teacher/product/product-detail/view-model/teacher_course_detail_cubit.dart';
import 'package:education_app_like_udemy/view/teacher/product/product-detail/view-model/teacher_course_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeacherCourseDetailPage extends StatelessWidget {
  const TeacherCourseDetailPage({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => TeahcerCourseDetailCubit()..getTeacherCourse(courseId: id),
        child: BlocBuilder<TeahcerCourseDetailCubit, ITeacherCourseDetailState>(
          builder: (context, state) {
            switch (state.status) {
              case GetCourseEnum.initial:
                return const Text("data");
              case GetCourseEnum.loading:
                return const Text("data");
              case GetCourseEnum.completed:
                return TeacherCourseDetailView(model: (state as TeacherCourseDetailCompletedState).response);
              case GetCourseEnum.error:
                return const Text("data");
            }
          },
        ),
      ),
    );
  }
}

class TeacherCourseDetailView extends StatelessWidget {
  const TeacherCourseDetailView({super.key, required this.model});
  final TeacherProductModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: context.height * 0.5,
              width: context.width,
            ),
            Align(
              child: Image.network(
                "https://10.0.2.2:7278/${model.imageUrl}",
                height: context.height * 0.35,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            Positioned(
              bottom: 0,
              right: context.width * 0.15,
              child: MyCourseDetailCard(model: model),
            )
          ],
        ),
        // Text(model.courseDescription.toString()),
        // Text(model.courseName.toString()),
        // Text(model.coursePrice.toString()),
        // Text(model.createdDate.toString()),,
        context.smallSpace,
        Text(
          "Müfredat",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: model.curriculums?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 3,
                margin: EdgeInsets.all(context.lowValue),
                child: ListTile(
                  leading: Text((index + 1).toString()),
                  title: Text(model.curriculums?[index].title.toString() ?? ""),
                  subtitle: Text(model.curriculums?[index].description.toString() ?? ""),
                  trailing: IconButton(
                      onPressed: () {
                        NavigationRoute.goRouteNormalWithParam(
                            RouteEnum.videoPage.rawValue, model.curriculums?[index].videoUrl.toString() as String);
                      },
                      icon: const Icon(Icons.videocam_outlined)),
                ),
              );
            },
          ),
        ),
        // Text(model.curriculums?.length.toString() ?? ""),
      ],
    );
  }
}

class MyCourseDetailCard extends StatelessWidget {
  const MyCourseDetailCard({
    super.key,
    required this.model,
  });
  final TeacherProductModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          SizedBox(
            height: context.height * 0.2,
            width: context.width * 0.7,
            child: Column(
              children: [
                Text(model.courseName.toString()),
                Text(model.courseDescription.toString()),
                Text(model.coursePrice.toString()),
                Text(model.createdDate.toString()),
                Text(model.starAvg.toString()),
                ElevatedButton(
                    onPressed: () {
                      // TODO kursu kaldır
                      // NavigationRoute.goWithInt(RouteEnum.commentPage.rawValue, model.courseID as int);
                    },
                    child: const Text("ksursu kaldir"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
