import 'package:async/async.dart';
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
  Future<Result<RandomJokeResponse>> getRandomJoke() async {
    try {
      final response = await _service.getData();
      if (response.data != null) {
        return Result.value(RandomJokeResponse.fromJson(response.data!));
      } else {
        return Result.error(NoDataFromApiError(response.statusCode));
      }
    } on DioError catch (dioError, stacktrace) {
      debugPrint(stacktrace.toString());
      return Result.error(dioError);
    } catch (e) {
      return Result.error(ApiFailedError(e));
    }
  }
}
