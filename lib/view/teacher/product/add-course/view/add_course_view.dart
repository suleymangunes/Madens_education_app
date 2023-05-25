import 'package:education_app_like_udemy/core/components/text/text_title_large_normal.dart';
import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/teacher/product/add-course/view-model/add_course_cubit.dart';
import 'package:education_app_like_udemy/view/teacher/product/add-course/view-model/add_course_state.dart';
import 'package:flutter/material.dart';
import 'package:education_app_like_udemy/view/teacher/product/add-course/model/add_course_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCourseView extends StatefulWidget {
  const AddCourseView({super.key});

  @override
  State<AddCourseView> createState() => _AddCourseViewState();
}

class _AddCourseViewState extends State<AddCourseView> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _priceController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCourseCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const TextTitleLarge(text: "Add Course"),
        ),
        body: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                context.normalSpace,
                SizedBox(
                  width: context.textFieldWidht,
                  child: TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.movie_creation_outlined),
                      border: OutlineInputBorder(),
                      label: Text("Course Name"),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "bos gecme";
                      }
                      return null;
                    },
                  ),
                ),
                context.normalSpace,
                SizedBox(
                  width: context.textFieldWidht,
                  child: TextFormField(
                    minLines: 3,
                    maxLines: 5,
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.description),
                      border: OutlineInputBorder(),
                      label: Text("Course Description"),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "bos gecme";
                      }
                      return null;
                    },
                  ),
                ),
                context.normalSpace,
                SizedBox(
                  width: context.textFieldWidht,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.attach_money_outlined),
                      border: OutlineInputBorder(),
                      label: Text("Course Price"),
                    ),
                    controller: _priceController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "bos gecme";
                      }
                      return null;
                    },
                  ),
                ),
                context.mediumSpace,
                BlocConsumer<AddCourseCubit, IAddCourseState>(
                  listener: (context, state) {
                    if (state is AddCourseLoadingState) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Center(child: CircularProgressIndicator()),
                            content: Text("Kurs oluşturuluyor. Lütfen bekleyiniz."),
                          );
                        },
                      );
                    } else if (state is AddCourseCompletedState) {
                      NavigationRoute.router.pop();
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("İşlem Başarılı"),
                            content: const Text("Kursunuz başarıyla oluşturulmuştur."),
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
                      // context.read<TeacherCoursesCubit>().getMyCourses();
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print("oldu");
                          var a = AddCourseModel(
                            courseName: _nameController.text,
                            courseDescription: _descriptionController.text,
                            coursePrice: num.parse(_priceController.text),
                            imageUrl: "string",
                            categoryId: 1,
                          );

                          // AddCourseService().addCourse(addCourseModel: a);
                          context.read<AddCourseCubit>().addCourse(addCourseModel: a);
                        }
                      },
                      child: const Text("Add Course"),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
