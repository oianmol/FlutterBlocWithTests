import 'package:async/async.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/domain/RandomJokeRepository.dart';
import 'package:test_app/model/RandomJokeResponse.dart';

class CategoriesBloc extends Bloc<LoadCategories, CategoriesState> {
  JokeCategoriesRepository repository;

  CategoriesBloc(this.repository) : super(const CategoriesState(false, [])) {
    on((event, emit) async {
      switch (event.runtimeType) {
        case LoadCategories:
          {
            emit(const CategoriesState(true, []));
            Result<Categories> response = await repository.getCategories();
            emit(CategoriesState(
                false, response.asValue?.value.categories ?? []));
          }
          break;
      }
    });
  }
}

class RandomJokesBloc extends Bloc<LoadRandomJoke, RandomJokeState> {
  RandomJokeRepository service;

  RandomJokesBloc(this.service)
      : super(const RandomJokeState(false, "No Data")) {
    on((event, emit) async {
      switch (event.runtimeType) {
        case LoadRandomJoke:
          {
            final category = event as LoadRandomJoke;
            emit(const RandomJokeState(true, "Loading"));
            Result<RandomJokeResponse> response = await service.getRandomJoke(category.category);
            emit(RandomJokeState(
                false, response.asValue?.value.value ?? "No Joke"));
          }
      }
    });
  }
}

class RandomJokeState extends Equatable {
  final bool isLoading;
  final String randomJoke;

  const RandomJokeState(this.isLoading, this.randomJoke);

  @override
  List<Object?> get props => [isLoading, randomJoke];
}

class LoadRandomJoke {
  String? category;

  LoadRandomJoke([this.category]);
}

class LoadCategories{}

class CategoriesState extends Equatable {
  final bool isLoading;
  final List<String> jokeCategories;

  const CategoriesState(this.isLoading, this.jokeCategories);

  @override
  List<Object?> get props => [isLoading, jokeCategories];
}

