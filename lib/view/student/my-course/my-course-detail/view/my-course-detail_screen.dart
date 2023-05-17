import 'package:education_app_like_udemy/core/components/text/text_body_medium.dart';
import 'package:education_app_like_udemy/core/components/text/text_title_large_normal.dart';
import 'package:education_app_like_udemy/core/components/text/text_title_medium.dart';
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/product/constants/api/api_constants.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/_product/widget/animation/lottie_loading_button.dart';
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
                  return const Center(child: LottieBigLoadingButton());
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
                "${ApiConstants.baseUrl}${model.imageUrl}",
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
                    icon: const Icon(Icons.videocam_outlined),
                  ),
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
            height: context.height * 0.22,
            width: context.width * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextTitleLarge(text: model.courseName.toString()),
                TextTitleMedium(text: model.courseDescription.toString()),
                TextBodyMedium(text: model.teacherName.toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextBodyMedium(text: "İlerleme Durumu: "),
                    Image.asset(
                      "assets/images/progress.png",
                      height: 60,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
