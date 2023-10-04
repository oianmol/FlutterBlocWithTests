import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/domain/RandomJokeRepository.dart';
import 'package:test_app/model/RandomJokeResponse.dart';
import 'package:test_app/screens/home/HomeBloc.dart';

class HomeScreenWithBloc extends StatelessWidget {
  final RandomJokeRepository _service;
  final JokeCategoriesRepository _jokeCategoriesRepository;

  const HomeScreenWithBloc(this._service, this._jokeCategoriesRepository,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RandomJokesBloc(_service)),
        BlocProvider(
            create: (context) => CategoriesBloc(_jokeCategoriesRepository))
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Random Joke App"),
        ),
        body: Column(
          children: [tabsConsumer(), randomJokeConsumer()],
        ),
        floatingActionButton: loadRandomJokeButton(context),
      ),
    );
  }

  Widget loadRandomJokeButton(BuildContext context) {
    return BlocConsumer<RandomJokesBloc, RandomJokeState>(
        listener: (context, state) {},
        builder: (context, state) => FloatingActionButton(
            onPressed: () {
              context.read<CategoriesBloc>().add(LoadCategories());
              context.read<RandomJokesBloc>().add(LoadRandomJoke());
            },
            key: const Key("load"),
            child: state.isLoading
                ? const CircularProgressIndicator()
                : const Icon(Icons.file_download)));
  }

  BlocConsumer<RandomJokesBloc, RandomJokeState> randomJokeConsumer() {
    return BlocConsumer<RandomJokesBloc, RandomJokeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Text(state.randomJoke,key: Key("jokeText"),).withPadding(const EdgeInsets
            .all(8));
      },
    );
  }

  BlocConsumer<CategoriesBloc, CategoriesState> tabsConsumer() {
    return BlocConsumer(
        builder: (context, state) {
          return ListView(
            scrollDirection: Axis.horizontal,
            children: state.jokeCategories
                .map((e) => Tab(
                      child: TextButton(
                        child: Text(e),
                        onPressed: () {
                          context.read<RandomJokesBloc>().add(LoadRandomJoke(e));
                        },
                      ),
                    ))
                .toList(),
          ).height(56);
        },
        listener: (context, state) {});
  }
}

extension UiExtension on Widget {
  Widget withPadding(EdgeInsets edgeInsets) {
    return Padding(padding: edgeInsets, child: this);
  }

  Widget height(double value) {
    return SizedBox(
      height: value,
      width: double.infinity,
      child: this,
    );
  }
}
