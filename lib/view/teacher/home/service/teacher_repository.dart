import 'dart:convert';
import 'dart:io';
import 'package:education_app_like_udemy/view/student/basket/model/basket_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class TeacherRepository {
  final Box _token = Hive.box('token');

  Future<List<Courses>> getAllCourses() async {
    final String token = _token.get('myToken');
    const String link = "https://10.0.2.2:7278/api/teacher";
    var c = await http.get(
      Uri.parse(link),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    List json = jsonDecode(c.body)["data"] as List;
    return json.map((e) => Courses.fromJson(e)).toList();
  }
}
