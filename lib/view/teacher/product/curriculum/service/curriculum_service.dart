import 'dart:convert';
import 'dart:io';

import 'package:education_app_like_udemy/view/teacher/product/curriculum/model/curriculum_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class CirruculumService {
  final Box _token = Hive.box('token');

  addCirruculum(CurriculumModel model) async {
    Map mapim = {
      "publishId": "string",
      "videoName": "string",
      "videoUrl": "string",
      "title": "string",
      "description": "string",
      "courseID": 1033
    };
    var jsonhali = jsonEncode(mapim);
    var sonhal = jsonDecode(jsonhali);
    final String token = _token.get('myToken');
    String link = "https://10.0.2.2:7278/api/Curriculum/createCurri";
    var c = await http.post(
      Uri.parse(link),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
      body: jsonEncode(model.toJson()),
    );
    print(c.body);
  }
}
