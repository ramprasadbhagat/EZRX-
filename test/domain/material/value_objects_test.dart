import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Material Code value object', () {
    test('should return material code with substring when not empty', () async {
      const input = '000000000023168451';
      final materialCode = MaterialCode(input);
      final result = materialCode.materialNumber;
      expect(result, '23168451');
    });

    test('should return NA when empty', () async {
      const input = '';
      final materialCode = MaterialCode(input);
      final result = materialCode.materialNumber;
      expect(result, 'NA');
    });
  });
}
