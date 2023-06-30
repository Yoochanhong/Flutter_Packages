import 'package:dio/dio.dart';

BaseOptions options =
    BaseOptions(baseUrl: "https://random-data-api.com/api/v2");

Dio dio = Dio(options);
