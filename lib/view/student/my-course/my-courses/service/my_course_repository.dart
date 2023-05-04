import 'dart:convert';
import 'dart:io';

import 'package:education_app_like_udemy/view/student/basket/model/basket_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

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
      print(json);
      return json.map((e) => BasketModel.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}
