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
  //TODO: Fix later in test case PR
  group('Material Price value object', () {
    //   test('should return NA if zero', () async {
    //     const input = 0.0;
    //     final price = MaterialPrice(input);
    //     final result = price.displayWithCurrency(
    //       currency: Currency('fake-currency'),
    //       hidePrice: false,
    //     );
    //     expect(result, 'NA');
    //   });
    //
    //   test('should return NA if hide price enable', () async {
    //     const input = 10.0;
    //     final price = MaterialPrice(input);
    //     final result = price.displayWithCurrency(
    //       currency: Currency('fake-currency'),
    //       hidePrice: true,
    //     );
    //     expect(result, 'NA');
    //   });
    //
    //   test('should remove trailing zero', () async {
    //     const input = 12.2000;
    //     final price = MaterialPrice(input);
    //     final result = price.displayWithCurrency(
    //       currency: Currency('fake-currency'),
    //       hidePrice: false,
    //     );
    //     expect(result, 'FAKE-CURRENCY 12.2');
    //   });
    //
    //   test('should align currency on the right with vnd currency', () async {
    //     const input = 12.23;
    //     final price = MaterialPrice(input);
    //     final result = price.displayWithCurrency(
    //       currency: Currency('vnd'),
    //       hidePrice: false,
    //     );
    //     expect(result, 'VND 12.23');
    //   });
    //
    //   test('should align currency on the left with other currency', () async {
    //     const input = 12.23;
    //     final price = MaterialPrice(input);
    //     final result = price.displayWithCurrency(
    //       currency: Currency('fake-currency'),
    //       hidePrice: false,
    //     );
    //     expect(result, 'FAKE-CURRENCY 12.23');
    //   });

    // test('should conform ZDP5 Rule', () async {
    //   const input = 10;
    //   final price = MaterialQty(input);
    //   final result = price.conformZDP5Rule('5');
    //   expect(result, true);
    // });
    //
    // test('should not conform when ZDP5 value is invalid', () async {
    //   const input = 10;
    //   final price = MaterialQty(input);
    //   final result = price.conformZDP5Rule('fake-value');
    //   expect(result, false);
    // });
    //
    // test('should add vatValue if isVNUser is false', () async {
    //   const input = 10.00;
    //   final price = MaterialPrice(input);
    //   final result = price.displayUnitPrice(
    //     currency: Currency('sgd'),
    //     hidePrice: false,
    //     isVNUser: false,
    //     vatValue: 8,
    //     enableTaxClassification: true,
    //     enableVat: true,
    //     taxClassification: MaterialTaxClassification('Full Tax'),
    //     taxes: ['10'],
    //   );
    //   expect(result, 'SGD 10.8');
    // });
    //
    // test('should add taxes if isVNUser is true', () async {
    //   const input = 10.00;
    //   final price = MaterialPrice(input);
    //   final result = price.displayUnitPrice(
    //     currency: Currency('sgd'),
    //     hidePrice: false,
    //     isVNUser: true,
    //     vatValue: 8,
    //     enableTaxClassification: true,
    //     enableVat: true,
    //     taxClassification: MaterialTaxClassification('Full Tax'),
    //     taxes: ['10'],
    //   );
    //   expect(result, 'SGD 11');
    // });
    //
    // test('should add nothing if taxClassification is noTax', () async {
    //   const input = 10.00;
    //   final price = MaterialPrice(input);
    //   final result = price.displayUnitPrice(
    //     currency: Currency('sgd'),
    //     hidePrice: false,
    //     isVNUser: false,
    //     vatValue: 8,
    //     enableTaxClassification: true,
    //     enableVat: true,
    //     taxClassification: MaterialTaxClassification('noTax'),
    //     taxes: ['10'],
    //   );
    //   expect(result, 'SGD 10');
    // });
    //
    // test('should add nothing if taxClassification is Exempt', () async {
    //   const input = 10.00;
    //   final price = MaterialPrice(input);
    //   final result = price.displayUnitPrice(
    //     currency: Currency('sgd'),
    //     hidePrice: false,
    //     isVNUser: false,
    //     vatValue: 8,
    //     enableTaxClassification: true,
    //     enableVat: true,
    //     taxClassification: MaterialTaxClassification('Exempt'),
    //     taxes: ['10'],
    //   );
    //   expect(result, 'SGD 10');
    // });
    //
    // test('should add nothing if enableTaxClassification is false', () async {
    //   const input = 10.00;
    //   final price = MaterialPrice(input);
    //   final result = price.displayUnitPrice(
    //     currency: Currency('sgd'),
    //     hidePrice: false,
    //     isVNUser: false,
    //     vatValue: 8,
    //     enableTaxClassification: false,
    //     enableVat: true,
    //     taxClassification: MaterialTaxClassification('Exempt'),
    //     taxes: ['10'],
    //   );
    //   expect(result, 'SGD 10');
    // });
    //
    // test('should add nothing if enableVat is false', () async {
    //   const input = 10.00;
    //   final price = MaterialPrice(input);
    //   final result = price.displayUnitPrice(
    //     currency: Currency('sgd'),
    //     hidePrice: false,
    //     isVNUser: false,
    //     vatValue: 8,
    //     enableTaxClassification: true,
    //     enableVat: false,
    //     taxClassification: MaterialTaxClassification('Exempt'),
    //     taxes: ['10'],
    //   );
    //   expect(result, 'SGD 10');
    // });
  });
}
