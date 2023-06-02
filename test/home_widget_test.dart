import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/data/RandomJokeRepositoryImpl.dart';
import 'package:test_app/domain/RandomJokeRepository.dart';
import 'package:test_app/main.dart';
import 'package:test_app/screens/home/HomeBloc.dart';

import 'FakeNetworkService.dart';

void main() {
  RandomJokeRepository service = RandomJokeRepositoryImpl(FakeNetworkService());
  testWidgets(
      'given floating action button clicked, when bloc loads the data, then we see the joke',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(MyApp(service));

    expect(find.text('No Data'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.file_download));
    await tester.pump();
    expect(find.text('A Joke'), findsOneWidget);
  });
}
