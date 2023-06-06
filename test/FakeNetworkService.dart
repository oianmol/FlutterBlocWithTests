import 'package:dio/dio.dart';
import 'package:test_app/domain/NetworkService.dart';

class FakeNetworkService extends NetworkService {
  @override
  Future<Response> getRandomJoke([String? category]) {
    return Future.value(Response(
        requestOptions: RequestOptions(),
        data: {"value": "A Joke"},
        statusCode: 200));
  }

  @override
  Future<Response> getCategories() {
    return Future.value(Response(
        requestOptions: RequestOptions(),
        data: ["animal","career","celebrity","dev","explicit","fashion","food","history","money","movie","music","political","religion","science","sport","travel"],
        statusCode: 200));
  }
}
