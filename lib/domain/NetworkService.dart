import 'package:dio/dio.dart';

abstract class NetworkService {
  Future<Response> getData();
}
