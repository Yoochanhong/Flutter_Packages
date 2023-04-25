import 'package:fluttersecurestorage/login_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<LoginResponse> getLoginResponse(String id, String pwd) async {
  final response = await http
      .post(Uri.parse("http://localhost:8080/signin?id=$id&password=$pwd"));
  if (response.statusCode == 200) {
    return LoginResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("아이디나 비밀번호를 잘못 입력함");
  }
}