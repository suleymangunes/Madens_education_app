// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:education_app_like_udemy/view/student/payment/model/payment_card_model.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  late final TextEditingController _cartName;
  late final TextEditingController _cartNumber;
  late final TextEditingController _expireMonth;
  late final TextEditingController _expireYear;
  late final TextEditingController _cvc;
  late final GlobalKey<FormState> _formKeyPayment;

  @override
  void initState() {
    super.initState();
    _cartName = TextEditingController();
    _cartNumber = TextEditingController();
    _expireMonth = TextEditingController();
    _expireYear = TextEditingController();
    _cvc = TextEditingController();
    _formKeyPayment = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    _cartName.dispose();
    _cartNumber.dispose();
    _expireMonth.dispose();
    _expireYear.dispose();
    _cvc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKeyPayment,
        child: Column(
          children: [
            TextFormField(
              controller: _cartName,
              decoration: const InputDecoration(
                hintText: "cart name",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "alani bos birakma";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _cartNumber,
              decoration: const InputDecoration(
                hintText: "cart number",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "alani bos birakma";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _expireMonth,
              decoration: const InputDecoration(
                hintText: "expire month",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "alani bos birakma";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _expireYear,
              decoration: const InputDecoration(
                hintText: "expire year",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "alani bos birakma";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _cvc,
              decoration: const InputDecoration(
                hintText: "cvc",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "alani bos birakma";
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKeyPayment.currentState!.validate()) {
                  final cardModel = PaymentCardModel(
                    cardHolderName: _cartName.text,
                    cardNumber: _cartNumber.text,
                    expireMonth: _expireMonth.text,
                    expireYear: _expireYear.text,
                    cvc: _cvc.text,
                  );
                  print("tamamdir");
                  PaymentService(cardModel: cardModel).payBasket();
                }
              },
              child: const Text("satin al"),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentService {
  final PaymentCardModel cardModel;
  PaymentService({
    required this.cardModel,
  });
  final _token = Hive.box('token');

  void payBasket() async {
    final body = cardModel.toJson();
    final token = _token.get('myToken');
    const String link = "https://10.0.2.2:7278/api/Iyzico";
    var x = await http.post(
      Uri.parse(link),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
      body: jsonEncode(body),
    );

    print(x.body);
  }
}
