import 'package:education_app_like_udemy/core/components/text/text_title_large_normal.dart';
import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/teacher/product/curriculum/model/curriculum_model.dart';
import 'package:education_app_like_udemy/view/teacher/product/curriculum/view-model/add_curriculum_cubit.dart';
import 'package:education_app_like_udemy/view/teacher/product/curriculum/view-model/add_curriculum_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCurriculumView extends StatefulWidget {
  const AddCurriculumView({super.key, required this.id});
  final int id;

  @override
  State<AddCurriculumView> createState() => _AddCurriculumViewState();
}

class _AddCurriculumViewState extends State<AddCurriculumView> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("bu kisim calisti mi bakalim dependeny");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextTitleLarge(text: "Add Curriculum"),
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
                  controller: _titleController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.title),
                    border: OutlineInputBorder(),
                    label: Text("Curriculum Title"),
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
                  minLines: 2,
                  maxLines: 5,
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(),
                    label: Text("Curriculum Description"),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "bos gecme";
                    }
                    return null;
                  },
                ),
              ),
              context.mediumSpace,
              BlocConsumer<AddCurriculumCubit, IAddCurriculumState>(
                listener: (context, state) {
                  if (state is AddCurriculumLoadingState) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          title: Center(child: CircularProgressIndicator()),
                          content: Text("Müfredat ekleniyor. Lütfen bekleyiniz."),
                        );
                      },
                    );
                  } else if (state is AddCurriculumCompletedState) {
                    NavigationRoute.router.pop();
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("İşlem Başarılı"),
                          content: const Text("Müfredat başarıyla eklenmiştir."),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                NavigationRoute.goRouteClear(RouteEnum.teacherHomePage.rawValue);
                                // // NavigationRoute.router.pop();
                                // // NavigationRoute.router.pop();
                                // // await Future.delayed(const Duration(seconds: 2));
                                // // context.read<TeahcerCourseDetailCubit>().getTeacherCourse(courseId: widget.id);

                                // // NavigationRoute.goWithIntClear(
                                // //     RouteEnum.teacherCourseDetailPage.rawValue, widget.id);
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
                        if (_formKey.currentState!.validate()) {
                          print(_titleController.text);
                          print(_descriptionController.text);
                          final model = CurriculumModel(
                            courseID: widget.id,
                            title: _titleController.text,
                            description: _descriptionController.text,
                            videoName: _titleController.text,
                            videoUrl: _titleController.text,
                            publishId: _titleController.text,
                          );
                          print(widget.id);
                          context.read<AddCurriculumCubit>().addCurriculum(model);
                        }
                      },
                      child: const Text("Add"));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
