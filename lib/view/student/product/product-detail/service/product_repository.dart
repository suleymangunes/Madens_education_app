import 'dart:convert';
import 'dart:io';

import 'package:education_app_like_udemy/view/student/product/product-detail/model/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  final _token = Hive.box('token');

  Future<ProductModel> getCourse({required id}) async {
    final token = _token.get('myToken');
    final String link = "https://10.0.2.2:7278/api/Course/listCourse/$id";
    print("bu kisma kadar sorun yok");
    var c = await http.get(
      Uri.parse(link),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    print(c.body);

    var json = jsonDecode(c.body)["data"];

    print(json);

    return ProductModel.fromJson(json);
  }
}
