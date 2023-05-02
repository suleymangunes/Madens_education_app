import 'package:education_app_like_udemy/core/components/image/listtile_image.dart';
import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "Search something...",
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
        return Card(
          margin: EdgeInsets.symmetric(horizontal: context.lowValue, vertical: context.lowValue),
          child: InkWell(
            onTap: () {},
            child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseData.courseName.toString(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      courseData.courseDescription.toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(courseData.coursePrice.toString()),
                    Text(courseData.createdDate.toString()),
                  ],
                ),
                trailing: LisstileImage(image: courseData.imageUrl.toString())),
          ),
        );
      },
    );
  }
}
