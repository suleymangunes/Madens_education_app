class PaymentCardModel {
  String? cardHolderName;
  String? cardNumber;
  String? expireMonth;
  String? expireYear;
  String? cvc;

  PaymentCardModel({this.cardHolderName, this.cardNumber, this.expireMonth, this.expireYear, this.cvc});

  PaymentCardModel.fromJson(Map<String, dynamic> json) {
    cardHolderName = json['cardHolderName'];
    cardNumber = json['cardNumber'];
    expireMonth = json['expireMonth'];
    expireYear = json['expireYear'];
    cvc = json['cvc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cardHolderName'] = cardHolderName;
    data['cardNumber'] = cardNumber;
    data['expireMonth'] = expireMonth;
    data['expireYear'] = expireYear;
    data['cvc'] = cvc;
    return data;
  }
}
