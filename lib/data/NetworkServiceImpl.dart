import 'package:dio/dio.dart';
import 'package:test_app/domain/NetworkService.dart';

class NetworkServiceImpl implements NetworkService {
  final Dio _dio = Dio();

  @override
  Future<Response> getData() async {
    return _dio.get("https://api.chucknorris.io/jokes/random");
  }
}
