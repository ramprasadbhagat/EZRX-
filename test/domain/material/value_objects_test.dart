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

  group('Material Group 4 value object', () {
    test('should return true when material group is 6A1', () async {
      const input = '6A1';
      final materialGroup = MaterialGroup.four(input);
      final result = materialGroup.isFOC;
      expect(result, true);
    });

    test('should return false when material group is 6GS', () async {
      const input = '6GS';
      final materialGroup = MaterialGroup.four(input);
      final result = materialGroup.isFOC;
      expect(result, false);
    });
  });
}
