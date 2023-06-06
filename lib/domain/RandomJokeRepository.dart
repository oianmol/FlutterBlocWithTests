import 'package:async/async.dart';
import 'package:test_app/model/RandomJokeResponse.dart';

mixin RandomJokeRepository {
  Future<Result<RandomJokeResponse>> getRandomJoke([String? category]);
}

mixin JokeCategoriesRepository {
  Future<Result<Categories>> getCategories();
}
