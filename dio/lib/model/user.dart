import 'package:dio_package/model/employment.dart';
import 'package:dio_package/model/address.dart';
import 'package:dio_package/model/subscription.dart';
import 'package:dio_package/model/creditcard.dart';

class User {
  int? id;
  String? uid;
  String? password;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? avatar;
  String? gender;
  String? phoneNumber;
  String? socialInsuranceNumber;
  String? dateOfBirth;
  Employment? employment;
  Address? address;
  CreditCard? creditCard;
  Subscription? subscription;

  User(
      {this.id,
      this.uid,
      this.password,
      this.firstName,
      this.lastName,
      this.username,
      this.email,
      this.avatar,
      this.gender,
      this.phoneNumber,
      this.socialInsuranceNumber,
      this.dateOfBirth,
      this.employment,
      this.address,
      this.creditCard,
      this.subscription});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    password = json['password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    avatar = json['avatar'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    socialInsuranceNumber = json['social_insurance_number'];
    dateOfBirth = json['date_of_birth'];
    employment = json['employment'] != null
        ? Employment.fromJson(json['employment'])
        : null;
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    creditCard = json['credit_card'] != null
        ? CreditCard.fromJson(json['credit_card'])
        : null;
    subscription = json['subscription'] != null
        ? Subscription.fromJson(json['subscription'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['password'] = password;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['username'] = username;
    data['email'] = email;
    data['avatar'] = avatar;
    data['gender'] = gender;
    data['phone_number'] = phoneNumber;
    data['social_insurance_number'] = socialInsuranceNumber;
    data['date_of_birth'] = dateOfBirth;
    if (employment != null) {
      data['employment'] = employment!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (creditCard != null) {
      data['credit_card'] = creditCard!.toJson();
    }
    if (subscription != null) {
      data['subscription'] = subscription!.toJson();
    }
    return data;
  }
}
