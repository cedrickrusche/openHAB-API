import 'package:openhab_api/openhab_api.dart' as oh;
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    oh.Openhab? api;

    setUp(() {
      api = oh.Openhab.create();
    });

    test('First Test', () {
      expect(api, isNotNull);
    });
  });
}
