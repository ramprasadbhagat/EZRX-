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
}
