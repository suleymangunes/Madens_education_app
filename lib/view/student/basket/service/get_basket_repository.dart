import 'dart:convert';
import 'dart:io';
import 'package:education_app_like_udemy/view/student/basket/model/basket_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class GetBasketRepository {
  final _token = Hive.box('token');

  Future<List<BasketModel>?>? getBasket() async {
    print("bu kisim calisiyor mu");
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
    print("bu ksiimda mi hata var");
    print(c.body);

    if (c.body.isNotEmpty) {
      print("peki bu kisim calisit mi");
      final json = jsonDecode(c.body)["data"] as List;
      return json.map((e) => BasketModel.fromJson(e)).toList();
    } else {
      return null;
    }
  }

  void removeItemFromBasket(int basketId) async {
    final token = _token.get('myToken');
    final String link = "https://10.0.2.2:7278/api/Basket/$basketId";
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
