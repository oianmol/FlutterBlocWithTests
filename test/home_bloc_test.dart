import 'package:bloc_test/bloc_test.dart';
import 'package:test_app/data/RandomJokeRepositoryImpl.dart';
import 'package:test_app/domain/RandomJokeRepository.dart';
import 'package:test_app/screens/home/HomeBloc.dart';

import 'FakeNetworkService.dart';

void main() {
  RandomJokeRepository service = RandomJokeRepositoryImpl(FakeNetworkService());

  blocTest(
    'emits Loading when load event is added',
    build: () => RandomJokesBloc(service),
    act: (bloc) => bloc.add(LoadRandomJoke()),
    expect: () =>
        [const RandomJokeState(true, "Loading"), const RandomJokeState(false, "A Joke")],
  );
}
