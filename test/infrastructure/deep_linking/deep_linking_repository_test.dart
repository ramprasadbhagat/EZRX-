import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class MockDeviceStorage extends Mock implements DeviceStorage {}

void main() {
  group('Extract order history', () {
//TODO: Revisit to write test for this

    test('- success for history details deeplinking', () {});
  });
}
