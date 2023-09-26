import 'package:ezrxmobile/infrastructure/core/crypto/decryption.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Decryption', () {
    late Decryption decryption;

    setUp(() {
      decryption = Decryption();
    });

    test('Decryption Data', () async {
      const dataEncrypted =
          '53616c7465645f5fc43ab15f2f89a2de95b0584241d3a13c8f362f7a3f381aed';

      expect(decryption.decrypt(dataEncrypted), '0');
    });
  });
}
