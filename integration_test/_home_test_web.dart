import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:test_app/main.dart' as app;

void main() {
  final IntegrationTestWidgetsFlutterBinding binding =
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('verify No Data', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    app.main();

    // Trigger a frame.
    await tester.pumpAndSettle();

    // Take a screenshot.
    await binding.takeScreenshot(
      'platform_name',
    );

    // Verify that platform is retrieved.
    expect(
      find.byWidgetPredicate(
            (Widget widget) =>
        widget is Text &&
            widget.data! == "No Data",
      ),
      findsOneWidget,
    );
  });

  testWidgets('verify screenshot', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    app.main();

    // Trigger a frame.
    await tester.pumpAndSettle();

    await binding.takeScreenshot(
      'platform_name_2',
    );
  });
}