import 'dart:convert';
import 'dart:io';

import 'package:education_app_like_udemy/view/student/home/model/course_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class SearchRepository {
  final _token = Hive.box('token');

  Future<List<Courses>?>? searchCourses({required String search}) async {
    await Future.delayed(const Duration(seconds: 5));
    final token = _token.get('myToken');
    print(token);
    print("biz ne arariz $search");
    final String link = "https://10.0.2.2:7278/api/Course/$search";
    print("bu kisma kadar sorun yok");
    var c = await http.get(
      Uri.parse(link),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    var result = jsonDecode(c.body)["data"] as List;
    if (result.isEmpty) {
      print("evet bos");
      return null;
    } else {
      print("aha sorun tam da burada");
      var json = jsonDecode(c.body)["data"] as List;
      print(json);

      return json.map((e) => Courses.fromJson(e)).toList();
    }
    // print(result);
    // print("sanirim su kisimda sorun oldu");
    // print(c.body);
  }
}
