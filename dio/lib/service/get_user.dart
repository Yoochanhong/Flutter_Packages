import 'package:dio_package/model/user.dart';
import 'package:dio_package/global/global.dart';

Future<User> getUser() async {
  final response = await dio.get("/users");
  if (response.statusCode == 200) {
    return User.fromJson(response.data);
  } else {
    throw Exception("요청 실패");
  }
}