import 'package:dio_package/model/coordinates.dart';

class Address {
  String? city;
  String? streetName;
  String? streetAddress;
  String? zipCode;
  String? state;
  String? country;
  Coordinates? coordinates;

  Address(
      {this.city,
      this.streetName,
      this.streetAddress,
      this.zipCode,
      this.state,
      this.country,
      this.coordinates});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    streetName = json['street_name'];
    streetAddress = json['street_address'];
    zipCode = json['zip_code'];
    state = json['state'];
    country = json['country'];
    coordinates = json['coordinates'] != null
        ? Coordinates.fromJson(json['coordinates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['street_name'] = streetName;
    data['street_address'] = streetAddress;
    data['zip_code'] = zipCode;
    data['state'] = state;
    data['country'] = country;
    if (coordinates != null) {
      data['coordinates'] = coordinates!.toJson();
    }
    return data;
  }
}
