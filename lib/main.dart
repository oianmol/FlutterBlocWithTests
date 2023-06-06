import 'package:flutter/material.dart';
import 'package:test_app/data/NetworkServiceImpl.dart';
import 'package:test_app/data/RandomJokeRepositoryImpl.dart';
import 'package:test_app/domain/CategoriesRepositoryImpl.dart';
import 'package:test_app/domain/NetworkService.dart';
import 'package:test_app/domain/RandomJokeRepository.dart';
import 'package:test_app/screens/home/MyHomePage.dart';

void main() {
  NetworkService networkService = NetworkServiceImpl();
  RandomJokeRepository service = RandomJokeRepositoryImpl(networkService);
  JokeCategoriesRepository jokeCategoriesRepository =
      CategoriesRepositoryImpl(networkService);

  runApp(MyApp(service, jokeCategoriesRepository));
}

class MyApp extends StatelessWidget {
  final RandomJokeRepository service;
  final JokeCategoriesRepository jokeCategoriesRepository;

  const MyApp(this.service, this.jokeCategoriesRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreenWithBloc(service, jokeCategoriesRepository),
    );
  }
}
