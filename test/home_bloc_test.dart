import 'package:bloc_test/bloc_test.dart';
import 'package:test_app/data/RandomJokeRepositoryImpl.dart';
import 'package:test_app/domain/RandomJokeRepository.dart';
import 'package:test_app/screens/home/HomeBloc.dart';

import 'FakeNetworkService.dart';

void main() {
  RandomJokeRepository service = RandomJokeRepositoryImpl(FakeNetworkService());

  blocTest(
    'emits HomeState(true, "Loading"), when HomeEvent.load is added',
    build: () => HomeBloc(service),
    act: (bloc) => bloc.add(HomeEvent.load),
    expect: () =>
        [const HomeState(true, "Loading"), const HomeState(false, "A Joke")],
  );
}
