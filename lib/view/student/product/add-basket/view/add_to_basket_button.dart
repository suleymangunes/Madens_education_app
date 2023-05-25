import 'package:education_app_like_udemy/core/init/theme/light/light_theme_custom.dart';
import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';
import 'package:education_app_like_udemy/view/_product/widget/animation/lottie_loading_button.dart';
import 'package:education_app_like_udemy/view/student/product/add-basket/model-view/basket_cubit.dart';
import 'package:education_app_like_udemy/view/student/product/add-basket/model-view/basket_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({super.key, required this.courseId});
  final int? courseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddBasketCubit(),
      child: BlocBuilder<AddBasketCubit, IBasketState>(
        builder: (context, state) {
          switch (state.status) {
            case GetCourseEnum.initial:
              return ElevatedButton(
                onPressed: () {
                  context.read<AddBasketCubit>().addToBasket(courseId);
                },
                child: const Text("Add to Basket"),
              );
            case GetCourseEnum.loading:
              return const ElevatedButton(
                onPressed: null,
                child: LottieBigLoadingButton(),
              );
            case GetCourseEnum.completed:
              return ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  disabledForegroundColor: Colors.white,
                  disabledBackgroundColor: LightThemeColors.scarlet,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [Text("Added to Basket"), Icon(Icons.done)],
                ),
              );
            case GetCourseEnum.error:
              return const ElevatedButton(
                onPressed: null,
                child: Text("Tekrar Dene"),
              );
          }
        },
      ),
    );
  }
}
