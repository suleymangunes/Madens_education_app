import 'dart:convert';
import 'dart:io';

import 'package:education_app_like_udemy/view/teacher/add-course/model/add_course_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;

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
    return Scaffold(
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
            ElevatedButton(
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
                  print(a.courseName);
                  print(a.courseDescription);
                  print(a.coursePrice);
                  var b = a.toJson();
                  print(b);
                  AddCourseService().addCourse(a);
                }
              },
              child: const Text("kurs ekle"),
            )
          ],
        ),
      ),
    );
  }
}

class AddCourseService {
  final Box _token = Hive.box('token');

  addCourse(AddCourseModel addCourseModel) async {
    var body = jsonEncode(addCourseModel.toJson());
    final String token = _token.get('myToken');

    const String link = "https://10.0.2.2:7278/api/Course/addCourse";
    var c = await http.post(Uri.parse(link),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
        body: body);
    print(c.body);
  }
}
