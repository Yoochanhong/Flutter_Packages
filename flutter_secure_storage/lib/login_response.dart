class LoginResponse {
  String? accessToken;
  String? message;
  String? refreshToken;

  LoginResponse({this.accessToken, this.message, this.refreshToken});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    message = json['message'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['message'] = message;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
