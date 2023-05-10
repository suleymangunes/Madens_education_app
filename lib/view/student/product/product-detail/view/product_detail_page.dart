// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:education_app_like_udemy/product/constants/api/api_constants.dart';
import 'package:education_app_like_udemy/view/student/product/add-basket/view/add_to_basket_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';
import 'package:education_app_like_udemy/view/student/product/product-detail/model/product_model.dart';
import 'package:education_app_like_udemy/view/student/product/product-detail/view-model/product_cubit.dart';
import 'package:education_app_like_udemy/view/student/product/product-detail/view-model/product_state.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    print(id);
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => ProductDetailCubit()..getProduct(id: id),
          child: BlocBuilder<ProductDetailCubit, IProductState>(
            builder: (context, state) {
              switch (state.status) {
                case GetCourseEnum.initial:
                  return const Center(child: Text("initial"));
                case GetCourseEnum.loading:
                  return const Center(child: Text("loading"));
                case GetCourseEnum.completed:
                  return ProductDetailScreen(model: (state as ProductCompletedState).model);
                case GetCourseEnum.error:
                  return const Center(child: Text("error"));
              }
            },
          ),
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    required this.model,
  });

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
                "https://10.0.2.2:7278/${model.imageUrl}",
                height: context.height * 0.35,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            Positioned(
              bottom: 0,
              right: context.width * 0.15,
              child: ProductDetailCard(model: model),
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

class ProductDetailCard extends StatelessWidget {
  const ProductDetailCard({
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
                AddToBasketButton(courseId: model.courseID),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
