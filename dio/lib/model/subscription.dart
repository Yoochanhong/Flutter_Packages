class Subscription {
  String? plan;
  String? status;
  String? paymentMethod;
  String? term;

  Subscription({this.plan, this.status, this.paymentMethod, this.term});

  Subscription.fromJson(Map<String, dynamic> json) {
    plan = json['plan'];
    status = json['status'];
    paymentMethod = json['payment_method'];
    term = json['term'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plan'] = plan;
    data['status'] = status;
    data['payment_method'] = paymentMethod;
    data['term'] = term;
    return data;
  }
}
