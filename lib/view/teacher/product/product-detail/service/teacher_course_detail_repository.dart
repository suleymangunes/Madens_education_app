import 'dart:convert';
import 'dart:io';
import 'package:education_app_like_udemy/view/teacher/product/product-detail/model/teacher_product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class TeacherCourseDeatilRepository {
  final _token = Hive.box('token');

  Future<TeacherProductModel> getTeacherCourse({required id}) async {
    final token = _token.get('myToken');
    final String link = "https://10.0.2.2:7278/api/Course/listCourse/$id";
    var c = await http.get(
      Uri.parse(link),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    var json = jsonDecode(c.body)["data"];
    return TeacherProductModel.fromJson(json);
  }
}
