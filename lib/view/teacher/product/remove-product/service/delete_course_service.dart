import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class DeleteCourseService {
  final Box _token = Hive.box('token');

  deleteCourseById(int id) async {
    final String token = _token.get('myToken');
    String link = "https://10.0.2.2:7278/api/Course?id=$id";
    var c = await http.delete(
      Uri.parse(link),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    print(c.body);
  }
}
