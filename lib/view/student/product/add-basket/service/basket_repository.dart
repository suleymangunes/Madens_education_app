import 'dart:io';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class BasketRepository {
  final _token = Hive.box('token');

  adToBasket(int id) async {
    final token = _token.get('myToken');
    final String link = "https://10.0.2.2:7278/api/Basket?courseId=$id";
    var c = await http.post(
      Uri.parse(link),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    print("sanirim su kisimda sorun oldu");
    print(c.body);
    // var json = jsonDecode(c.body)["data"]["courses"] as List;
    // print(json);
    // print(json[0]);
  }
}
