import 'package:dio/dio.dart';

abstract class NetworkService {
  Future<Response> getRandomJoke([String? category]);
  Future<Response> getCategories();
}
