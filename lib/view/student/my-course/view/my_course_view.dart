// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';
import 'package:education_app_like_udemy/view/student/basket/model/basket_model.dart';

class MyCourseView extends StatelessWidget {
  const MyCourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Course"),
      ),
      body: BlocProvider(
        create: (context) => MyCourseCubit()..getMyCourses(),
        child: BlocBuilder<MyCourseCubit, IMyCourseState>(
          builder: (context, state) {
            print(state.status);
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const Text("data");
              },
            );
          },
        ),
      ),
    );
  }
}

class MyCourseCubit extends Cubit<IMyCourseState> {
  MyCourseCubit() : super(MyCourseInitial());

  Future<void> getMyCourses() async {
    try {
      emit(MyCourseLoading());
      final response = await MyCourseRepository().getMyCourses();
      if (response != null) {
        emit(MyCourseCompleted(response));
      } else {
        emit(MyCourseError("Kursunuz bulunmamakta"));
      }
    } catch (e) {
      emit(MyCourseError(e.toString()));
    }
  }
}

abstract class IMyCourseState {
  GetCourseEnum status;
  IMyCourseState({required this.status});
}

class MyCourseInitial extends IMyCourseState {
  MyCourseInitial() : super(status: GetCourseEnum.initial);
}

class MyCourseLoading extends IMyCourseState {
  MyCourseLoading() : super(status: GetCourseEnum.loading);
}

class MyCourseCompleted extends IMyCourseState {
  final List<BasketModel> response;
  MyCourseCompleted(this.response) : super(status: GetCourseEnum.completed);
}

class MyCourseError extends IMyCourseState {
  final String message;
  MyCourseError(this.message) : super(status: GetCourseEnum.error);
}

class MyCourseRepository {
  final _token = Hive.box('token');

  Future<List<BasketModel>?>? getMyCourses() async {
    final token = _token.get('myToken');
    const String link = "https://10.0.2.2:7278/api/Basket/listMyCourse";
    var c = await http.get(
      Uri.parse(link),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    if (jsonDecode(c.body)["data"] != null) {
      var json = jsonDecode(c.body)["data"] as List;
      return json.map((e) => BasketModel.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}
