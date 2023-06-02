import 'package:async/async.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/domain/RandomJokeRepository.dart';
import 'package:test_app/model/RandomJokeResponse.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  RandomJokeRepository service;

  HomeBloc(this.service) : super(const HomeState(false, "No Data")) {
    on((event, emit) async {
      switch (event) {
        case HomeEvent.load:
          {
            emit(const HomeState(true, "Loading"));
            Result<RandomJokeResponse> response = await service.getRandomJoke();
            emit(HomeState(false, response.asValue?.value.value ?? "No Joke"));
          }
      }
    });
  }
}

class HomeState extends Equatable {
  final bool isLoading;
  final String data;

  const HomeState(this.isLoading, this.data);

  @override
  List<Object?> get props => [isLoading, data];
}

enum HomeEvent {
  load;
}
