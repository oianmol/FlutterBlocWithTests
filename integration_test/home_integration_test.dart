import 'package:integration_test/integration_test.dart';

import '_home_test_io.dart' if (dart.library.html) '_home_test_web.dart'
    as tests;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  tests.main();
}
