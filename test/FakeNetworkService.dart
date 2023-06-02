import 'package:dio/dio.dart';
import 'package:test_app/domain/NetworkService.dart';

class FakeNetworkService extends NetworkService {
  @override
  Future<Response> getData() {
    return Future.value(Response(
        requestOptions: RequestOptions(),
        data: {"value": "A Joke"},
        statusCode: 200));
  }
}