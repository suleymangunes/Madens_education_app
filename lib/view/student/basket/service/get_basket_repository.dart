import 'dart:convert';
import 'dart:io';
import 'package:education_app_like_udemy/view/student/basket/model/basket_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class GetBasketRepository {
  final _token = Hive.box('token');

  Future<List<Courses>?>? getBasket() async {
    final token = _token.get('myToken');
    const String link = "https://10.0.2.2:7278/api/Basket";

    var c = await http.get(
      Uri.parse(link),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    print("buraya geliyor ancak isi bos");

    print(c.body);

    if (c.body.isNotEmpty) {
      print("peki bu kisim calisit mi");
      final json = jsonDecode(c.body)["data"][0]["courses"] as List;
      print(json);

      return json.map((e) => Courses.fromJson(e)).toList();
    } else {
      return null;
    }
  }

  Future<void> removeItemFromBasket(int courseId) async {
    final token = _token.get('myToken');
    final String link = "https://10.0.2.2:7278/api/Basket/$courseId";
    await http.delete(
      Uri.parse(link),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
  }
}
