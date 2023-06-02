import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/domain/RandomJokeRepository.dart';
import 'package:test_app/screens/home/HomeBloc.dart';

class HomeScreenWithBloc extends StatelessWidget {
  final RandomJokeRepository service;

  const HomeScreenWithBloc(this.service, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeBloc(service),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Random Joke App"),
              ),
              body: Center(
                child: Text(state.data),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  context.read<HomeBloc>().add(HomeEvent.load);
                },
                child: state.isLoading
                    ? const CircularProgressIndicator()
                    : const Icon(Icons.file_download),
              ), // This trailing comma makes auto-formatting nicer for build methods.
            );
          },
        ));
  }
}
