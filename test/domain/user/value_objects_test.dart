import 'package:ezrxmobile/domain/user/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SalesOrg value object', () {
    test(
      'should return ZPTH when get BU Name with SalesOrg 2900',
      () async {
        const input = '2900';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.buName;
        expect(result, 'ZPTH');
      },
    );

    test(
      'should return ZPTW when get BU Name with SalesOrg 2805',
      () async {
        const input = '2805';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.buName;
        expect(result, 'ZPTW');
      },
    );

    test(
      'should return ZPSG when get BU Name with SalesOrg 2601',
      () async {
        const input = '2601';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.buName;
        expect(result, 'ZPSG');
      },
    );
  });

  group('RoleName value object', () {
    test(
      'should return true when check can proxy login with ROOT Admin role',
      () async {
        const input = 'ROOT Admin';
        final roleName = RoleName(input);
        final result = roleName.canLoginOnBehalf;
        expect(result, true);
      },
    );

    test(
      'should return true when check can proxy login with ZP Admin role',
      () async {
        const input = 'ZP Admin';
        final roleName = RoleName(input);
        final result = roleName.canLoginOnBehalf;
        expect(result, true);
      },
    );

    test(
      'should return false when check can proxy login with Client User role',
      () async {
        const input = 'Client User';
        final roleName = RoleName(input);
        final result = roleName.canLoginOnBehalf;
        expect(result, false);
      },
    );
  });
}
