import 'dart:convert';
import 'dart:io';

import 'package:education_app_like_udemy/view/student/home/model/course_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class CourseRepository {
  final _token = Hive.box('token');

  Future<List<Courses>> getAllCourses() async {
    final token = _token.get('myToken');
    print(token);
    const String link = "https://10.0.2.2:7278/api/Course/GetAll?page=2";
    print("bu kisma kadar sorun yok");
    var c = await http.get(
      Uri.parse(link),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    print("sanirim su kisimda sorun oldu");
    var json = jsonDecode(c.body)["data"]["courses"] as List;
    // print(json);
    print(json[0]);
    return json.map((e) => Courses.fromJson(e)).toList();
  }
}
