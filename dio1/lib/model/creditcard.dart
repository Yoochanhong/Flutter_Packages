class CreditCard {
  String? ccNumber;

  CreditCard({this.ccNumber});

  CreditCard.fromJson(Map<String, dynamic> json) {
    ccNumber = json['cc_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cc_number'] = ccNumber;
    return data;
  }
}