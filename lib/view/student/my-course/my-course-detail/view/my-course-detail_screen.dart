import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/student/my-course/my-course-detail/view-model/my_course_detail_cubit.dart';
import 'package:education_app_like_udemy/view/student/my-course/my-course-detail/view-model/my_course_detail_state.dart';
import 'package:education_app_like_udemy/view/student/product/product-detail/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';

class MyCourseDetailScreen extends StatelessWidget {
  const MyCourseDetailScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (context) => MyCourseDetailCubit()..getMyCourseDeatil(id),
          child: BlocBuilder<MyCourseDetailCubit, IMyCourseDetailState>(
            builder: (context, state) {
              switch (state.status) {
                case GetCourseEnum.initial:
                  return const Text("this is initial");
                case GetCourseEnum.loading:
                  return const Text("this is loading");
                case GetCourseEnum.completed:
                  return MyCourseDetailCompletedScreen(model: (state as MyCourseDetailCompletedState).response);
                case GetCourseEnum.error:
                  return const Text("this is error");
              }
            },
          ),
        ),
      ),
    );
  }
}

class MyCourseDetailCompletedScreen extends StatelessWidget {
  const MyCourseDetailCompletedScreen({super.key, required this.model});
  final ProductModel model;

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
                model.imageUrl.toString(),
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
  final ProductModel model;

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
                      NavigationRoute.goWithInt(RouteEnum.commentPage.rawValue, model.courseID as int);
                    },
                    child: const Text("yorumlar"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
