import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Material Code value object', () {
    test('should return material code with substring when not empty', () async {
      const input = '000000000023168451';
      final materialNumber = MaterialNumber(input);
      final result = materialNumber.displayMatNo;
      expect(result, '23168451');
    });

    test('should return NA when empty', () async {
      const input = '';
      final materialNumber = MaterialNumber(input);
      final result = materialNumber.displayMatNo;
      expect(result, 'NA');
    });
  });
}
