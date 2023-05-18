import 'dart:convert';
import 'dart:io';
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:education_app_like_udemy/core/components/text/text_title_large_normal.dart';
import 'package:education_app_like_udemy/core/init/theme/light/light_theme_custom.dart';
import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';
import 'package:education_app_like_udemy/view/student/payment/model/payment_card_model.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 1.0,
      ),
    );
    super.initState();
  }

  void _onValidate() {}

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const TextTitleLarge(text: "Payment"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              bankName: 'Madens Bank',
              showBackView: isCvvFocused,
              obscureCardNumber: false,
              obscureCardCvv: false,
              isHolderNameVisible: true,
              backgroundImage: 'assets/images/credit_card_background.PNG',
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      formKey: formKey,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      themeColor: LightThemeColors.scarlet,
                      textColor: Theme.of(context).hintColor,
                      cardNumberDecoration: InputDecoration(
                        labelText: 'Card Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                        hintStyle: TextStyle(color: Theme.of(context).focusColor),
                        labelStyle: TextStyle(color: Theme.of(context).hintColor),
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                      expiryDateDecoration: InputDecoration(
                        hintStyle: TextStyle(color: Theme.of(context).focusColor),
                        labelStyle: TextStyle(color: Theme.of(context).hintColor),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: InputDecoration(
                        hintStyle: TextStyle(color: Theme.of(context).focusColor),
                        labelStyle: TextStyle(color: Theme.of(context).hintColor),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: InputDecoration(
                        hintStyle: TextStyle(color: Theme.of(context).focusColor),
                        labelStyle: TextStyle(color: Theme.of(context).hintColor),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Card Holder',
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocProvider(
                        create: (context) => PaymentCubit(),
                        child: BlocConsumer<PaymentCubit, IPaymentState>(
                          listener: (context, state) {
                            if (state is PaymentLoadingState) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    title: Center(child: CircularProgressIndicator()),
                                    content: Text("Ödeme işlemi gerçekleştiriyor. Lütfen bekleyiniz."),
                                  );
                                },
                              );
                            } else if (state is PaymentCompletedState) {
                              NavigationRoute.router.pop();
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("İşlem Başarılı"),
                                    content: const Text("Ödeme işleminiz başarıyla gerçekleştirilmiştir."),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            NavigationRoute.goRouteClear(RouteEnum.studentHomePage.rawValue);
                                            // NavigationRoute.router.pop();
                                            // NavigationRoute.router.pop();
                                            // context.read<GetBasketCubit>().getBasket();
                                          },
                                          child: const Text("Kurslarıma git"))
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  var a = PaymentCardModel(
                                    cardHolderName: cardHolderName,
                                    cardNumber: cardNumber.replaceAll(" ", ""),
                                    cvc: cvvCode,
                                    expireMonth: expiryDate.split("/")[0],
                                    expireYear: expiryDate.split("/")[1],
                                  );
                                  context.read<PaymentCubit>().payBasket(a);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Satin Al",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                                ),
                              ),
                            );
                          },
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentCubit extends Cubit<IPaymentState> {
  PaymentCubit() : super(PaymentInitialState());

  Future<void> payBasket(PaymentCardModel cardModel) async {
    try {
      emit(PaymentLoadingState());
      var response = await PaymentService(cardModel: cardModel).payBasket();
      emit(PaymentCompletedState());
    } catch (e) {
      emit(PaymentErrorState());
    }
  }
}

abstract class IPaymentState {
  GetCourseEnum status;
  IPaymentState({
    required this.status,
  });
}

class PaymentInitialState extends IPaymentState {
  PaymentInitialState() : super(status: GetCourseEnum.initial);
}

class PaymentLoadingState extends IPaymentState {
  PaymentLoadingState() : super(status: GetCourseEnum.loading);
}

class PaymentCompletedState extends IPaymentState {
  PaymentCompletedState() : super(status: GetCourseEnum.completed);
}

class PaymentErrorState extends IPaymentState {
  PaymentErrorState() : super(status: GetCourseEnum.error);
}

class PaymentService {
  final PaymentCardModel cardModel;
  PaymentService({
    required this.cardModel,
  });
  final _token = Hive.box('token');

  Future<String> payBasket() async {
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

    return x.body;
  }
}
