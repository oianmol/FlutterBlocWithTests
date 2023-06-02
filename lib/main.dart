import 'package:flutter/material.dart';
import 'package:test_app/data/NetworkServiceImpl.dart';
import 'package:test_app/data/RandomJokeRepositoryImpl.dart';
import 'package:test_app/domain/RandomJokeRepository.dart';
import 'package:test_app/screens/home/MyHomePage.dart';

void main() {
  RandomJokeRepository service = RandomJokeRepositoryImpl(NetworkServiceImpl());
  runApp(MyApp(service));
}

class MyApp extends StatelessWidget {
  final RandomJokeRepository service;

  const MyApp(this.service, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreenWithBloc(service),
    );
  }
}
