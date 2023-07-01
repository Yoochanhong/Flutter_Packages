import 'dart:convert';

import 'package:freezed_package/model/todo.dart';
import 'package:http/http.dart' as http;

Future<Todo> getTodos() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos/1"));
  if (response.statusCode == 200) {
    return Todo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}
