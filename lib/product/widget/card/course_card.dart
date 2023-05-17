import 'package:education_app_like_udemy/core/components/image/listtile_image.dart';
import 'package:education_app_like_udemy/core/components/text/text_body_medium.dart';
import 'package:education_app_like_udemy/core/extension/border/border_extension.dart';
import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/product/constants/api/api_constants.dart';
import 'package:education_app_like_udemy/product/widget/text/card_description_text.dart';
import 'package:education_app_like_udemy/product/widget/text/card_title_text.dart';
import 'package:education_app_like_udemy/product/widget/text/text_price.dart';
import 'package:flutter/material.dart';

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
      shape: RoundedRectangleBorder(
        borderRadius: context.imageBorder,
      ),
      margin: EdgeInsets.symmetric(horizontal: context.lowValue, vertical: context.lowValue),
      child: InkWell(
        onTap: () {
          NavigationRoute.goWithInt(path as String, id as int);
        },
        child: Row(
          children: [
            context.cardxSmallSpace,
            _cardImage(),
            context.cardSmallSpace,
            _cardContent(context),
          ],
        ),
      ),
    );
  }

  LisstileImage _cardImage() {
    return LisstileImage(
      image: "${ApiConstants.baseUrl}$imageurl",
    );
  }

  SizedBox _cardContent(BuildContext context) {
    return SizedBox(
      height: context.cardContentSize,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitleText(courseName: courseName),
          CardDescriptionText(courseDescription: courseDescription),
          TextBodyMedium(text: teacherName),
          TextPrice(price: price),
        ],
      ),
    );
  }
}
