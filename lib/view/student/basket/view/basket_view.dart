import 'package:education_app_like_udemy/core/components/image/listtile_image.dart';
import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/_product/widget/animation/lottie_loading_button.dart';
import 'package:education_app_like_udemy/view/student/basket/model-view/get_basket_cubit.dart';
import 'package:education_app_like_udemy/view/student/basket/model-view/get_basket_state.dart';
import 'package:education_app_like_udemy/view/student/basket/service/get_basket_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Basket",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          backgroundColor: Colors.white,
        ),
        body: BlocProvider(
          create: (context) => GetBasketCubit()..getBasket(),
          child: BlocBuilder<GetBasketCubit, IGetBasketState>(
            builder: (context, state) {
              switch (state.status) {
                case GetCourseEnum.initial:
                  return Center(
                    child: Text("Sepetinizde bir şey bulunmamaktadir.", style: Theme.of(context).textTheme.bodyLarge),
                  );
                case GetCourseEnum.loading:
                  return const Center(child: LottieBigLoadingButton());
                case GetCourseEnum.completed:
                  if (state is GetBasketCompleted && state.basketList.isNotEmpty) {
                    return BasketListBuilder(data: state);
                  } else {
                    return Center(
                      child: Text("Sepetinizde bir şey bulunmamaktadir.", style: Theme.of(context).textTheme.bodyLarge),
                    );
                  }
                case GetCourseEnum.error:
                  return Center(
                    child: Text("Sepetiniz boş görünüyor..", style: Theme.of(context).textTheme.bodyLarge),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}

class BasketListBuilder extends StatelessWidget {
  const BasketListBuilder({super.key, required this.data});
  final GetBasketCompleted data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: data.basketList.length,
            itemBuilder: (BuildContext context, int index) {
              // print(data.basketList[index].courses?[0].courseName);
              final model = data.basketList[index];
              return BasketCard(
                courseName: model.courseName.toString() ?? "",
                courseDescription: model.courseDescription.toString() ?? "",
                price: model.coursePrice.toString() ?? "",
                date: model.createdDate.toString() ?? "",
                imageurl: "https://10.0.2.2:7278/${model.imageUrl}" ?? "",
                id: model.courseID ?? 1,
                teacherName: model.teacherName.toString() ?? "",
                basketId: model.courseID,
              );
              // return const Text("data");
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              const Text("fiyat su kadar vs"),
              ElevatedButton(
                onPressed: () {
                  NavigationRoute.goRouteNormal(RouteEnum.payment.rawValue);
                },
                child: const Text("satin al"),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class BasketCard extends StatelessWidget {
  const BasketCard({
    super.key,
    required this.courseName,
    required this.courseDescription,
    required this.price,
    required this.date,
    required this.imageurl,
    required this.id,
    required this.teacherName,
    required this.basketId,
  });
  final String courseName;
  final String courseDescription;
  final String price;
  final String date;
  final String imageurl;
  final String teacherName;
  final int? id;
  final int? basketId;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: context.lowValue, vertical: context.lowValue),
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
            ElevatedButton(
              onPressed: () async {
                print("id degerimiz sudur: $id");
                GetBasketRepository().removeItemFromBasket(id as int);
                await Future.delayed(const Duration(milliseconds: 200));
                context.read<GetBasketCubit>().getBasket();
              },
              child: const Text("Sepetten Kaldır"),
            ),
          ],
        ),
        trailing: LisstileImage(image: imageurl),
      ),
    );
  }
}
