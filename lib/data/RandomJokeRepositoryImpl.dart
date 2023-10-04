import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_app/domain/NetworkService.dart';
import 'package:test_app/domain/NoDataFromApiError.dart';
import 'package:test_app/domain/RandomJokeRepository.dart';
import 'package:test_app/model/RandomJokeResponse.dart';

class RandomJokeRepositoryImpl implements RandomJokeRepository {
  final NetworkService _service;

  RandomJokeRepositoryImpl(this._service);

  @override
  Future<RandomJokeResponse> getRandomJoke([String? category]) async {
    try {
      final response = await _service.getRandomJoke(category);
      if (response.data != null) {
        return Future.value(RandomJokeResponse.fromJson(response.data!));
      } else {
        return Future.error(NoDataFromApiError(response.statusCode));
      }
    } on DioException catch (dioError, stacktrace) {
      debugPrint(stacktrace.toString());
      return Future.error(dioError);
    } catch (e) {
      return Future.error(ApiFailedError(e));
    }
  }
}
