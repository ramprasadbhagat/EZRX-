import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CompanyName value object', () {
    test(
      'should return company name when not empty',
      () async {
        const input = 'fake-company-name';
        final companyName = CompanyName(input);
        final result = companyName.name;
        expect(result, 'fake-company-name');
      },
    );

    test(
      'should return NA when empty',
      () async {
        const input = '';
        final companyName = CompanyName(input);
        final result = companyName.name;
        expect(result, 'NA');
      },
    );
  });

  group('SoldToParty value object', () {
    test(
      'should return soldToPartyName when not empty',
      () async {
        const input = 'fake-sold-to-name';
        final soldToParty = SoldToParty(input);
        final result = soldToParty.name;
        expect(result, 'fake-sold-to-name');
      },
    );

    test(
      'should return NA when empty',
      () async {
        const input = '';
        final soldToParty = SoldToParty(input);
        final result = soldToParty.name;
        expect(result, 'NA');
      },
    );
  });

  group('ShipToParty value object', () {
    test(
      'should return ShipToPartyName when not empty',
      () async {
        const input = 'fake-ship-to-name';
        final shipToParty = ShipToParty(input);
        final result = shipToParty.name;
        expect(result, 'fake-ship-to-name');
      },
    );

    test(
      'should return NA when empty',
      () async {
        const input = '';
        final shipToParty = ShipToParty(input);
        final result = shipToParty.name;
        expect(result, 'NA');
      },
    );
  });

  group('Principal Name Value Object', () {
    test('should return PrincipalName when not empty', () {

      const input = 'fake-principal-name';
      final principalName = PrincipalName(input);
      final result = principalName.name;
      expect(result, 'fake-principal-name');

    });

    test(
      'should return NA when empty',
      () async {
        const input = '';
        final principalName = PrincipalName(input);
        final result = principalName.name;
        expect(result, 'NA');
      },
    );
  });

  group('MaterialTaxClassification Name Value Object', () {
    test('should return true when there is no Tax', () {
      const input = 'noTax';
      final valObj = MaterialTaxClassification(input);
      final result = valObj.isNoTax();
      expect(result, true);
    });

    test('should return false when there is fake Tax', () {
      const input = 'fake-Tax';
      final valObj = MaterialTaxClassification(input);
      final result = valObj.isNoTax();
      expect(result, false);
    });

    test('should return true when there is Exempt', () {
      const input = 'Exempt';
      final valObj = MaterialTaxClassification(input);
      final result = valObj.isExempt();
      expect(result, true);
    });

    test('should return false when there is not Exempt', () {
      const input = 'fake-data';
      final valObj = MaterialTaxClassification(input);
      final result = valObj.isExempt();
      expect(result, false);
    });

    test('should return true when there is full tax', () {
      const input = 'Product : Full Tax';
      final valObj = MaterialTaxClassification(input);
      final result = valObj.isFullTax;
      expect(result, true);
    });

    test('should return false when there is no is full tax', () {
      const input = 'fake-data';
      final valObj = MaterialTaxClassification(input);
      final result = valObj.isFullTax;
      expect(result, false);
    });

  });

  group('Material Number Value Object', () {
    test('should display Material Number when not empty', () {
      const input = '000034134';
      final valObj = MaterialNumber(input);
      final result = valObj.displayMatNo;
      expect(result, '34134');
    });

    test(
      'should return true when there is Valid Material',
      () async {
        const input = '000034134';
        final valObj = MaterialNumber(input);
        final result = valObj.isValidMaterial([MaterialNumber('000034134')]);
        expect(result, true);
      },
    );

    test(
      'should return true when there is not Valid Material',
      () async {
        const input = '000034134';
        final valObj = MaterialNumber(input);
        final result = valObj.isValidMaterial([MaterialNumber('000052435')]);
        expect(result, false);
      },
    );
  });

  group('Material Price Value Object', () {
    test('should true when is empty', () {
      const input = 0.0;
      final valObj = MaterialPrice(input);
      final result = valObj.isEmpty();
      expect(result, true);
    });

    test('should false when is not empty', () {
      const input = 5.0;
      final valObj = MaterialPrice(input);
      final result = valObj.isEmpty();
      expect(result, false);
    });
  });
}
