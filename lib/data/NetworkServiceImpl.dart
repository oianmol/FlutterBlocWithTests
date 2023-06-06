import 'package:dio/dio.dart';
import 'package:test_app/domain/NetworkService.dart';
import 'package:test_app/model/RandomJokeResponse.dart';

class NetworkServiceImpl implements NetworkService {
  final Dio _dio = Dio();

  @override
  Future<Response> getRandomJoke([String? category]) async {
    var categoryParam = "";
    if (category != null) {
      categoryParam = "?category=$category";
    }
    return await _dio
        .get("https://api.chucknorris.io/jokes/random$categoryParam");
  }

  @override
  Future<Response> getCategories() async {
    return await _dio.get("https://api.chucknorris.io/jokes/categories");
  }
}
