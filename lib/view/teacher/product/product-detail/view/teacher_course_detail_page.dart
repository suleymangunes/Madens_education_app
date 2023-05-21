// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:education_app_like_udemy/core/components/text/text_title_large_normal.dart';
import 'package:education_app_like_udemy/core/components/text/text_title_medium.dart';
import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/product/constants/api/api_constants.dart';
import 'package:education_app_like_udemy/product/widget/text/text_price.dart';
import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/_product/widget/animation/lottie_loading_button.dart';
import 'package:education_app_like_udemy/view/teacher/product/change-image/service/change_image_service.dart';
import 'package:education_app_like_udemy/view/teacher/product/product-detail/model/teacher_product_model.dart';
import 'package:education_app_like_udemy/view/teacher/product/product-detail/view-model/teacher_course_detail_cubit.dart';
import 'package:education_app_like_udemy/view/teacher/product/product-detail/view-model/teacher_course_detail_state.dart';
import 'package:education_app_like_udemy/view/teacher/product/remove-product/view-model/delete_course_cubit.dart';
import 'package:education_app_like_udemy/view/teacher/product/remove-product/view-model/delete_course_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeacherCourseDetailPage extends StatelessWidget {
  const TeacherCourseDetailPage({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => TeahcerCourseDetailCubit()..getTeacherCourse(courseId: id),
          child: BlocConsumer<TeahcerCourseDetailCubit, ITeacherCourseDetailState>(
            listener: (context, state) {
              print("yaz bakalim");
            },
            builder: (context, state) {
              switch (state.status) {
                case GetCourseEnum.initial:
                  return const Text("data");
                case GetCourseEnum.loading:
                  return const Center(child: LottieBigLoadingButton());
                case GetCourseEnum.completed:
                  return TeacherCourseDetailView(model: (state as TeacherCourseDetailCompletedState).response);
                case GetCourseEnum.error:
                  return const Text("data");
              }
            },
          ),
        ),
      ),
    );
  }
}

class TeacherCourseDetailView extends StatefulWidget {
  const TeacherCourseDetailView({super.key, required this.model});
  final TeacherProductModel model;

  @override
  State<TeacherCourseDetailView> createState() => _TeacherCourseDetailViewState();
}

class _TeacherCourseDetailViewState extends State<TeacherCourseDetailView> {
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
                "${ApiConstants.baseUrl}${widget.model.imageUrl}",
                height: context.height * 0.35,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/icon/icon.png",
                    height: context.height * 0.35,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              right: context.width * 0.15,
              child: TeacherCourseDetailCard(model: widget.model),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: FloatingActionButton.small(
                backgroundColor: Colors.black45,
                onPressed: () async {
                  await ChangeImageService().changeImage(widget.model.courseID as int);
                  context.read<TeahcerCourseDetailCubit>().getTeacherCourse(courseId: widget.model.courseID as int);
                },
                child: const Icon(Icons.photo_library_outlined),
              ),
            ),
          ],
        ),
        context.smallSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Müfredat",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextButton(
              onPressed: () {
                // CirruculumService().addCirruculumByCourseId(widget.model.courseID as int);
                NavigationRoute.goWithInt(RouteEnum.addCurriculumPage.rawValue, widget.model.courseID as int);
              },
              child: const Text("Ekle"),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: widget.model.curriculums?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 3,
                margin: EdgeInsets.all(context.lowValue),
                child: ListTile(
                  leading: Text((index + 1).toString()),
                  title: Text(widget.model.curriculums?[index].title.toString() ?? ""),
                  subtitle: Text(widget.model.curriculums?[index].description.toString() ?? ""),
                  trailing: IconButton(
                      onPressed: () {
                        NavigationRoute.goRouteNormalWithParam(RouteEnum.videoPage.rawValue,
                            widget.model.curriculums?[index].videoUrl.toString() as String);
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

class TeacherCourseDetailCard extends StatelessWidget {
  const TeacherCourseDetailCard({
    super.key,
    required this.model,
  });
  final TeacherProductModel model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteCourseCubit(),
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            SizedBox(
              height: context.height * 0.2,
              width: context.width * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextTitleLarge(text: model.courseName.toString()),
                  TextTitleMedium(text: model.courseDescription.toString()),
                  TextPrice(price: model.coursePrice.toString()),
                  BlocConsumer<DeleteCourseCubit, IDeleteCourseState>(
                    listener: (context, state) {
                      if (state is DeleteCourseLodingState) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title: Center(child: CircularProgressIndicator()),
                              content: Text("Kurs kaldırılıyor. Lütfen bekleyiniz."),
                            );
                          },
                        );
                      } else if (state is DeleteCourseCompletedState) {
                        NavigationRoute.router.pop();
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("İşlem Başarılı"),
                              content: const Text("Kursunuz başarıyla kaldırılmıştırs."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    NavigationRoute.goRouteClear(RouteEnum.teacherHomePage.rawValue);
                                  },
                                  child: const Text("Kurslarıma git"),
                                )
                              ],
                            );
                          },
                        );
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          context.read<DeleteCourseCubit>().deleteCourse(model.courseID as int);
                        },
                        child: const Text("Kursu Kaldır"),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
