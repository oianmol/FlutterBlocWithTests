import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_app/domain/NetworkService.dart';
import 'package:test_app/domain/NoDataFromApiError.dart';
import 'package:test_app/domain/RandomJokeRepository.dart';
import 'package:test_app/model/RandomJokeResponse.dart';

class CategoriesRepositoryImpl implements JokeCategoriesRepository {
  final NetworkService _service;

  CategoriesRepositoryImpl(this._service);

  @override
  Future<Result<Categories>> getCategories() async {
    try {
      final response = await _service.getCategories();
      if (response.data != null) {
        return Result.value(Categories.fromJson(response.data!));
      } else {
        return Result.error(NoDataFromApiError(response.statusCode));
      }
    } on DioException catch (dioError, stacktrace) {
      debugPrint(stacktrace.toString());
      return Result.error(dioError);
    } catch (e) {
      return Result.error(ApiFailedError(e));
    }
  }
}

extension HttpStatus on Response {
  bool isSuccess() {
    return statusCode != null && (statusCode! >= 200 || statusCode! <= 299);
  }
}
