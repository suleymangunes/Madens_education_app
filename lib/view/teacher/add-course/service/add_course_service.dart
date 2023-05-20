import 'dart:convert';
import 'dart:io';
import 'package:education_app_like_udemy/view/teacher/add-course/model/add_course_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class AddCourseService {
  final Box _token = Hive.box('token');

  addCourse({required AddCourseModel addCourseModel}) async {
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
