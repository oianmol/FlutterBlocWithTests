import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/data/RandomJokeRepositoryImpl.dart';
import 'package:test_app/domain/CategoriesRepositoryImpl.dart';
import 'package:test_app/domain/NetworkService.dart';
import 'package:test_app/domain/RandomJokeRepository.dart';
import 'package:test_app/main.dart';

import 'FakeNetworkService.dart';

void main() {
  NetworkService networkService = FakeNetworkService();
  RandomJokeRepository service = RandomJokeRepositoryImpl(networkService);
  JokeCategoriesRepository jokeCategoriesRepository = CategoriesRepositoryImpl(networkService);

  testWidgets(
      'given floating action button clicked, when bloc loads the data, then we see the joke',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(MyApp(service, jokeCategoriesRepository));

    expect(find.text('No Data'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.file_download));
    await tester.pump();
    expect(find.text('A Joke'), findsOneWidget);
  });
}
