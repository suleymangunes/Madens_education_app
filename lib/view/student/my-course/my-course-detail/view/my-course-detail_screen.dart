// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:education_app_like_udemy/view/student/product/product-detail/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';
import 'package:education_app_like_udemy/view/student/my-course/my-course-detail/service/my_course_detail_repository.dart';

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
        child: Column(
          children: [
            Text(id.toString()),
            Text(id.toString()),
            Text(id.toString()),
            Text(id.toString()),
            Text(id.toString()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MyCourseDeatilRepository().getMyCourse(id: id);
        },
      ),
    );
    // Column(
    //   children: [
    //     Stack(
    //       children: [
    //         SizedBox(
    //           height: context.height * 0.5,
    //           width: context.width,
    //         ),
    //         Align(
    //           child: Image.network(
    //             "model.imageUrl.toString()",
    //             height: context.height * 0.35,
    //             fit: BoxFit.cover,
    //             alignment: Alignment.center,
    //           ),
    //         ),
    //         Positioned(
    //           bottom: 0,
    //           right: context.width * 0.15,
    //           child: ProductDetailCard(model: model),
    //         )
    //       ],
    //     ),
    //     // Text(model.courseDescription.toString()),
    //     // Text(model.courseName.toString()),
    //     // Text(model.coursePrice.toString()),
    //     // Text(model.createdDate.toString()),,
    //     context.smallSpace,
    //     Text(
    //       "Müfredat",
    //       style: Theme.of(context).textTheme.titleMedium,
    //     ),
    //     Expanded(
    //       child: ListView.builder(
    //         itemCount: model.curriculums?.length ?? 0,
    //         itemBuilder: (BuildContext context, int index) {
    //           return Card(
    //             elevation: 3,
    //             margin: EdgeInsets.all(context.lowValue),
    //             child: ListTile(
    //               leading: Text((index + 1).toString()),
    //               title: Text(model.curriculums?[index].title.toString() ?? ""),
    //               subtitle: Text(model.curriculums?[index].description.toString() ?? ""),
    //             ),
    //           );
    //         },
    //       ),
    //     ),
    //     // Text(model.curriculums?.length.toString() ?? ""),
    //   ],
    // );
  }
}

class MyCourseDetailCubit extends Cubit<IMyCourseDetailState> {
  MyCourseDetailCubit() : super(MyCourseDetailInitialState());

  Future<void> getMyCourseDeatil(int id) async {
    try {
      emit(MyCourseDetailLoadingState());
      final response = await MyCourseDeatilRepository().getMyCourse(id: id);
      emit(MyCourseDetailCompletedState(response));
    } catch (e) {
      emit(MyCourseDetailErrorState(e.toString()));
    }
  }
}

abstract class IMyCourseDetailState {
  GetCourseEnum status;
  IMyCourseDetailState({
    required this.status,
  });
}

class MyCourseDetailInitialState extends IMyCourseDetailState {
  MyCourseDetailInitialState() : super(status: GetCourseEnum.initial);
}

class MyCourseDetailLoadingState extends IMyCourseDetailState {
  MyCourseDetailLoadingState() : super(status: GetCourseEnum.loading);
}

class MyCourseDetailCompletedState extends IMyCourseDetailState {
  final ProductModel response;
  MyCourseDetailCompletedState(this.response) : super(status: GetCourseEnum.completed);
}

class MyCourseDetailErrorState extends IMyCourseDetailState {
  final String message;
  MyCourseDetailErrorState(this.message) : super(status: GetCourseEnum.error);
}

class ProductDetailCard extends StatelessWidget {
  const ProductDetailCard({
    super.key,
    required this.model,
  });
  final model;

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
                ElevatedButton(onPressed: () {}, child: const Text(""))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
