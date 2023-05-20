// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:flutter/material.dart';

import 'package:education_app_like_udemy/view/teacher/add-course/model/add_course_model.dart';
import 'package:education_app_like_udemy/view/teacher/add-course/service/add_course_service.dart';
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
          title: const Text("this is title"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: "name",
                ),
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  hintText: "description",
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "price",
                ),
                controller: _priceController,
              ),
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
                    child: const Text("kurs ekle"),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddCourseCubit extends Cubit<IAddCourseState> {
  AddCourseCubit() : super(AddCourseInitialState());

  Future<void> addCourse({required AddCourseModel addCourseModel}) async {
    try {
      emit(AddCourseLoadingState());
      await AddCourseService().addCourse(addCourseModel: addCourseModel);
      emit(AddCourseCompletedState());
    } catch (e) {
      emit(AddCourseErrorState());
    }
  }
}

abstract class IAddCourseState {}

class AddCourseInitialState extends IAddCourseState {
  AddCourseInitialState() : super();
}

class AddCourseLoadingState extends IAddCourseState {
  AddCourseLoadingState() : super();
}

class AddCourseCompletedState extends IAddCourseState {
  AddCourseCompletedState() : super();
}

class AddCourseErrorState extends IAddCourseState {
  AddCourseErrorState() : super();
}
