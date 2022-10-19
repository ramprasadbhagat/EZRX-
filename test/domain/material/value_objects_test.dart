import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
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

  group('Material Group 2 value object', () {
    test('should return true when material group is 6A1', () async {
      const input = '6A1';
      final materialGroup = MaterialGroup.two(input);
      final result = materialGroup.isFOC;
      expect(result, true);
    });

    test('should return false when material group is 6GS', () async {
      const input = '6GS';
      final materialGroup = MaterialGroup.two(input);
      final result = materialGroup.isFOC;
      expect(result, false);
    });
  });

  group('Material Price value object', () {
    test('should return NA if zero', () async {
      const input = 0.0;
      final price = MaterialPrice(input);
      final result = price.displayWithCurrency(Currency('fake-currency'));
      expect(result, 'NA');
    });

    test('should remove trailing zero', () async {
      const input = 12.2000;
      final price = MaterialPrice(input);
      final result = price.displayWithCurrency(Currency('fake-currency'));
      expect(result, '\$12.2');
    });

    test('should align currency on the right with vnd currency', () async {
      const input = 12.23;
      final price = MaterialPrice(input);
      final result = price.displayWithCurrency(Currency('vnd'));
      expect(result, '12.23₫');
    });

    test('should align currency on the left with other currency', () async {
      const input = 12.23;
      final price = MaterialPrice(input);
      final result = price.displayWithCurrency(Currency('fake-currency'));
      expect(result, '\$12.23');
    });
  });
}
