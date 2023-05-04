import 'dart:convert';
import 'dart:io';
import 'package:education_app_like_udemy/view/student/product/product-detail/model/product_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class MyCourseDeatilRepository {
  final _token = Hive.box('token');

  Future<ProductModel> getMyCourse({required id}) async {
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
    return ProductModel.fromJson(json);
  }
}
