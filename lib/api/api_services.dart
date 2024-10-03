import 'dart:developer';

import 'package:bloc_graphql_implements_101/data/todo.dart';
import 'package:dio/dio.dart';

class ApiServices {
  static late Dio _api;

  ApiServices.init() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
    );
    Dio dio = Dio(options);

    _api = dio;
  }

  Future<List<Todo>> getTodo() async {
    final serviceRes = await _api.get("/todos");
    // await Future.delayed(const Duration(seconds: 5));
    return List.generate(
      serviceRes.data.length,
      (index) {
        return Todo.fromJson(serviceRes.data[index]);
      },
    );
  }
}
