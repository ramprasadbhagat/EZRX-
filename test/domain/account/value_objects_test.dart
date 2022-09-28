import 'package:ezrxmobile/domain/account/value/value_objects.dart';
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

    test(
      'should return 2601 - ZPSG when get Full Name with SalesOrg 2601',
      () async {
        const input = '2601';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.fullName;
        expect(result, '2601 - ZPSG');
      },
    );

    test(
      'should return 2001 - ZPMY when get Full Name with SalesOrg 2001',
      () async {
        const input = '2001';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.fullName;
        expect(result, '2001 - ZPMY');
      },
    );

    test(
      'should return 2902 - ZPTH when get Full Name with SalesOrg 2902',
      () async {
        const input = '2902';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.fullName;
        expect(result, '2902 - ZPTH');
      },
    );

    test(
      'should return TH when get country with SalesOrg 2902',
      () async {
        const input = '2902';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.country;
        expect(result, 'TH');
      },
    );

    test(
      'should return TW when get country with SalesOrg 2804',
      () async {
        const input = '2804';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.country;
        expect(result, 'TW');
      },
    );

    test(
      'should return VN when get country with SalesOrg 3070',
      () async {
        const input = '3070';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.country;
        expect(result, 'VN');
      },
    );
  });

  group('RoleType value object', () {
    test(
      'should return true when check can proxy login with ROOT Admin role',
      () async {
        const input = 'root_admin';
        final roleType = RoleType(input);
        final result = roleType.canLoginOnBehalf;
        expect(result, true);
      },
    );

    test(
      'should return true when check can proxy login with ZP Admin role',
      () async {
        const input = 'zp_admin';
        final roleType = RoleType(input);
        final result = roleType.canLoginOnBehalf;
        expect(result, true);
      },
    );

    test(
      'should return false when check can proxy login with External Sales Rep role',
      () async {
        const input = 'external_sales_rep';
        final roleType = RoleType(input);
        final result = roleType.canLoginOnBehalf;
        expect(result, false);
      },
    );

    test(
      'should return salesRep when check login user type with Internal Sales Rep role',
      () async {
        const input = 'internal_sales_rep';
        final roleType = RoleType(input);
        final result = roleType.loginUserType;
        expect(result, 'salesRep');
      },
    );

    test(
      'should return salesRep when check login user type with External Sales Rep role',
      () async {
        const input = 'external_sales_rep';
        final roleType = RoleType(input);
        final result = roleType.loginUserType;
        expect(result, 'salesRep');
      },
    );

    test(
      'should return client when check login user type with Client user role',
      () async {
        const input = 'client_user';
        final roleType = RoleType(input);
        final result = roleType.loginUserType;
        expect(result, 'client');
      },
    );

    test(
      'should return MRXR when check purchase order type with Internal Sales Rep role',
      () async {
        const input = 'internal_sales_rep';
        final roleType = RoleType(input);
        final result = roleType.purchaseOrderType;
        expect(result, 'MRXR');
      },
    );

    test(
      'should return MRXP when check purchase order type with External Sales Rep role',
      () async {
        const input = 'external_sales_rep';
        final roleType = RoleType(input);
        final result = roleType.purchaseOrderType;
        expect(result, 'MRXP');
      },
    );

    test(
      'should return MRXC when check purchase order type with Client Admin role',
      () async {
        const input = 'client_admin';
        final roleType = RoleType(input);
        final result = roleType.purchaseOrderType;
        expect(result, 'MRXC');
      },
    );
  });

  group('Currency value object', () {
    test(
      'should return Taiwan (NT\$) currency symbol when given twd input',
      () async {
        const input = 'twd';
        final currency = Currency(input);
        final result = currency.symbol;
        expect(result, 'NT\$');
      },
    );

    test(
      'should return Malaysia (RM) currency symbol when given myr input',
      () async {
        const input = 'myr';
        final currency = Currency(input);
        final result = currency.symbol;
        expect(result, 'RM');
      },
    );

    test(
      'should return Singapore (\$)  currency symbol when given sgd input',
      () async {
        const input = 'sgd';
        final currency = Currency(input);
        final result = currency.symbol;
        expect(result, '\$');
      },
    );
  });

  group('UserType for SalesRep', () {
    test(
      'should return true when user userType is internal_sales_rep',
      () async {
        const input = 'internal_sales_rep';
        final salesRep = RoleType(input);
        final result = salesRep.isSalesRep;
        expect(result, true);
      },
    );

    test(
      'should return true when user userType is external_sales_rep',
      () async {
        const input = 'external_sales_rep';
        final salesRep = RoleType(input);
        final result = salesRep.isSalesRep;
        expect(result, true);
      },
    );

    test(
      'should return false when user userType is some dummy',
      () async {
        const input = 'dummy';
        final salesRep = RoleType(input);
        final result = salesRep.isSalesRep;
        expect(result, false);
      },
    );
  });
}
