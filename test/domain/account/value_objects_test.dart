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
    group('Email value object', () {
      test('Should Return myezrx@zuelligpharma.com when Sales org 2001', () {
        const input = '2001';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'myezrx@zuelligpharma.com');
      });
      test('Should Return Zinkohtay@zuelligpharma.com when Sales org 2200', () {
        const input = '2200';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'Zinkohtay@zuelligpharma.com');
      });
      test('Should Return Zinkohtay@zuelligpharma.com when Sales org 2201', () {
        const input = '2201';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'Zinkohtay@zuelligpharma.com');
      });
      test('Should Return Zinkohtay@zuelligpharma.com when Sales org 2203', () {
        const input = '2203';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'Zinkohtay@zuelligpharma.com');
      });
      test('Should Return Zinkohtay@zuelligpharma.com when Sales org 2250', () {
        const input = '2250';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'Zinkohtay@zuelligpharma.com');
      });
      test('Should Return PHZPCallCenter@zuelligpharma.com when Sales org 2500',
          () {
        const input = '2500';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'PHZPCallCenter@zuelligpharma.com');
      });
      test('Should Return customerservice@metrodrug.com.ph when Sales org 2501',
          () {
        const input = '2501';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'customerservice@metrodrug.com.ph');
      });
      test(
          'Should Return SGZPSCallCenterMailbox@zuelligpharma.com when Sales org 2601',
          () {
        const input = '2601';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'SGZPSCallCenterMailbox@zuelligpharma.com');
      });
      test('Should Return ezrx4u@zuelligpharma.com when Sales org 2800', () {
        const input = '2800';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'ezrx4u@zuelligpharma.com');
      });
      test('Should Return ezrx4u@zuelligpharma.com when Sales org 2801', () {
        const input = '2801';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'ezrx4u@zuelligpharma.com');
      });
      test('Should Return ezrx4u@zuelligpharma.com when Sales org 2802', () {
        const input = '2802';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'ezrx4u@zuelligpharma.com');
      });
      test('Should Return ezrx4u@zuelligpharma.com when Sales org 2803', () {
        const input = '2803';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'ezrx4u@zuelligpharma.com');
      });
      test('Should Return ezrx4u@zuelligpharma.com when Sales org 2804', () {
        const input = '2804';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'ezrx4u@zuelligpharma.com');
      });
      test('Should Return ezrx4u@zuelligpharma.com when Sales org 2805', () {
        const input = '2805';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'ezrx4u@zuelligpharma.com');
      });
      test('Should Return ZPTH-CS-CRC@zuelligpharma.com when Sales org 2900',
          () {
        const input = '2900';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'ZPTH-CS-CRC@zuelligpharma.com');
      });
      test('Should Return ZPTH-CS-CRC@zuelligpharma.com when Sales org 2902',
          () {
        const input = '2902';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'ZPTH-CS-CRC@zuelligpharma.com');
      });
      test('Should Return dat.hang@ezrx.com.vn when Sales org 3070', () {
        const input = '3070';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'dat.hang@ezrx.com.vn');
      });
      test('Should Return dat.hang@ezrx.com.vn when Sales org 3000', () {
        const input = '3000';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'dat.hang@ezrx.com.vn');
      });
      test('Should Return dat.hang@ezrx.com.vn when Sales org 3001', () {
        const input = '3001';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'dat.hang@ezrx.com.vn');
      });
      test('Should Return dat.hang@ezrx.com.vn when Sales org 3050', () {
        const input = '3050';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'dat.hang@ezrx.com.vn');
      });
      test('Should Return dat.hang@ezrx.com.vn when Sales org 3072', () {
        const input = '3072';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'dat.hang@ezrx.com.vn');
      });
      test('Should Return dat.hang@ezrx.com.vn when Sales org 3090', () {
        const input = '3090';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'dat.hang@ezrx.com.vn');
      });
    });

    group('Contact Number value object', () {
      test('Should Return 1800883711 when Sales org 2001', () {
        const input = '2001';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '1800883711');
      });
      test('Should Return Phone +9519345524, when Sales org 2200', () {
        const input = '2200';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '+9519345524');
      });
      test('Should Return Phone +959797207000, when Sales org 2200', () {
        const input = '2200';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[1];
        expect(result, '+959797207000');
      });
      test('Should Return Phone +9519345524 when Sales org 2201', () {
        const input = '2201';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '+9519345524');
      });
      test('Should Return Phone +9519345524 when Sales org 2201', () {
        const input = '2201';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[1];
        expect(result, '+959797207000');
      });

      test('Should Return Phone +9519345524, when Sales org 2203', () {
        const input = '2203';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '+9519345524');
      });
      test('Should Return +959797207000, when Sales org 2203', () {
        const input = '2203';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[1];
        expect(result, '+959797207000');
      });

      test('Should Return +9519345524, when Sales org 2250', () {
        const input = '2250';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '+9519345524');
      });
      test('Should Return +959797207000, when Sales org 2250', () {
        const input = '2250';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[1];
        expect(result, '+959797207000');
      });

      test('Should Return Telephone Number: +63282366488 when Sales org 2500',
          () {
        const input = '2500';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '+63282366488');
      });

      test('Should Return 0284241228  when Sales org 2501', () {
        const input = '2501';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '0284241228');
      });
      test('Should Return 0495598120 when Sales org 2501', () {
        const input = '2501';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[1];
        expect(result, '0495598120');
      });
      test('09190560455 when Sales org 2501', () {
        const input = '2501';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[2];
        expect(result, '09190560455');
      });

      test('Should Return +6565483190 when Sales org 2601', () {
        const input = '2601';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '+6565483190');
      });

      test('Should Return 0809090887 when Sales org 2800', () {
        const input = '2800';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '0809090887');
      });

      test('Should Return 0809090887 when Sales org 2801', () {
        const input = '2801';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '0809090887');
      });

      test('Should Return 0809090887 when Sales org 2802', () {
        const input = '2802';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '0809090887');
      });

      test('Should Return 0809090887 when Sales org 2803', () {
        const input = '2803';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '0809090887');
      });

      test('Should Return 0809090887 when Sales org 2804', () {
        const input = '2804';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '0809090887');
      });

      test('Should Return 0809090887 when Sales org 2805', () {
        const input = '2805';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '0809090887');
      });

      test('Should Return +6621231000 when Sales org 2900', () {
        const input = '2900';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '+6621231000');
      });
      test('Should Return 1800500000 when Sales org 2900', () {
        const input = '2900';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[1];
        expect(result, '1800500000');
      });

      test('Should Return +6621231000 when Sales org 2902', () {
        const input = '2902';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '+6621231000');
      });
      test('Should Return 1800500000 when Sales org 2902', () {
        const input = '2902';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[1];
        expect(result, '1800500000');
      });

      test('Should Return  1800555558  when Sales org 3070', () {
        const input = '3070';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '1800555558');
      });

      test('Should Return 1800555558  when Sales org 3000', () {
        const input = '3000';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '1800555558');
      });

      test('1800555558 when Sales org 3001', () {
        const input = '3001';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '1800555558');
      });

      test('1800555558 when Sales org 3050', () {
        const input = '3050';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '1800555558');
      });

      test('Should Return 1800555558 when Sales org 3072', () {
        const input = '3072';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '1800555558');
      });

      test('Should Return 1800555558 when Sales org 3090', () {
        const input = '3090';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result, '1800555558');
      });
    });

    group('Contact name value object', () {
      test('Should Return My eZRx Support Team when Sales org 2001', () {
        const input = '2001';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'My eZRx Support Team');
      });
      test('Should Return Mr Zin Ko Htay, Trade Sales Team when Sales org 2200',
          () {
        const input = '2200';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'Mr Zin Ko Htay, Trade Sales Team');
      });
      test('Should Return Mr Zin Ko Htay, Trade Sales Team when Sales org 2201',
          () {
        const input = '2201';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'Mr Zin Ko Htay, Trade Sales Team');
      });

      test('Should Return Mr Zin Ko Htay, Trade Sales Team when Sales org 2203',
          () {
        const input = '2203';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'Mr Zin Ko Htay, Trade Sales Team');
      });

      test('Should Return Mr Zin Ko Htay, Trade Sales Team when Sales org 2250',
          () {
        const input = '2250';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'Mr Zin Ko Htay, Trade Sales Team');
      });

      test('Should Return ZPC Customer Service when Sales org 2500', () {
        const input = '2500';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'ZPC Customer Service');
      });

      test('Should Return MDI Customer Service when Sales org 2501', () {
        const input = '2501';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'MDI Customer Service');
      });

      test('Should Return SG Customer Support when Sales org 2601', () {
        const input = '2601';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'SG Customer Support');
      });

      test('Should Return eZRx Service Team when Sales org 2800', () {
        const input = '2800';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'eZRx Service Team');
      });

      test('Should Return eZRx Service Team when Sales org 2801', () {
        const input = '2801';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'eZRx Service Team');
      });

      test('Should Return eZRx Service Team when Sales org 2802', () {
        const input = '2802';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'eZRx Service Team');
      });

      test('Should Return eZRx Service Team when Sales org 2803', () {
        const input = '2803';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'eZRx Service Team');
      });

      test('Should Return eZRx Service Team when Sales org 2804', () {
        const input = '2804';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'eZRx Service Team');
      });

      test('Should ReturneZRx Service Team when Sales org 2805', () {
        const input = '2805';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'eZRx Service Team');
      });

      test('Should Return ZP Thailand Customer Support when Sales org 2900',
          () {
        const input = '2900';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'ZP Thailand Customer Support');
      });

      test('Should Return ZP Thailand Customer Support when Sales org 2902',
          () {
        const input = '2902';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'ZP Thailand Customer Support');
      });

      test(
          'Should Return Ty TNHH Thương Mại và Dược Phẩm Sang when Sales org 3070',
          () {
        const input = '3070';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'Ty TNHH Thương Mại và Dược Phẩm Sang');
      });

      test(
          'Should Return Ty TNHH Thương Mại và Dược Phẩm Sang when Sales org 3000',
          () {
        const input = '3000';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'Ty TNHH Thương Mại và Dược Phẩm Sang');
      });

      test(
          'Should Return Ty TNHH Thương Mại và Dược Phẩm Sang when Sales org 3001',
          () {
        const input = '3001';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'Ty TNHH Thương Mại và Dược Phẩm Sang');
      });

      test(
          'Should Return Ty TNHH Thương Mại và Dược Phẩm Sang when Sales org 3050',
          () {
        const input = '3050';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'Ty TNHH Thương Mại và Dược Phẩm Sang');
      });

      test(
          'Should Return Ty TNHH Thương Mại và Dược Phẩm Sang when Sales org 3072',
          () {
        const input = '3072';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'Ty TNHH Thương Mại và Dược Phẩm Sang');
      });

      test(
          'Should Return Ty TNHH Thương Mại và Dược Phẩm Sang when Sales org 3090',
          () {
        const input = '3090';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'Ty TNHH Thương Mại và Dược Phẩm Sang');
      });
    });
  });

  group('Email value object', () {
    test('Should Return myezrx@zuelligpharma.com when Sales org 2001', () {
      const input = '2001';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'myezrx@zuelligpharma.com');
    });
    test('Should Return Zinkohtay@zuelligpharma.com when Sales org 2200', () {
      const input = '2200';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'Zinkohtay@zuelligpharma.com');
    });
    test('Should Return Zinkohtay@zuelligpharma.com when Sales org 2201', () {
      const input = '2201';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'Zinkohtay@zuelligpharma.com');
    });
    test('Should Return Zinkohtay@zuelligpharma.com when Sales org 2203', () {
      const input = '2203';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'Zinkohtay@zuelligpharma.com');
    });
    test('Should Return Zinkohtay@zuelligpharma.com when Sales org 2250', () {
      const input = '2250';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'Zinkohtay@zuelligpharma.com');
    });
    test('Should Return PHZPCallCenter@zuelligpharma.com when Sales org 2500',
        () {
      const input = '2500';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'PHZPCallCenter@zuelligpharma.com');
    });
    test('Should Return customerservice@metrodrug.com.ph when Sales org 2501',
        () {
      const input = '2501';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'customerservice@metrodrug.com.ph');
    });
    test(
        'Should Return SGZPSCallCenterMailbox@zuelligpharma.com when Sales org 2601',
        () {
      const input = '2601';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'SGZPSCallCenterMailbox@zuelligpharma.com');
    });
    test('Should Return ezrx4u@zuelligpharma.com when Sales org 2800', () {
      const input = '2800';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'ezrx4u@zuelligpharma.com');
    });
    test('Should Return ezrx4u@zuelligpharma.com when Sales org 2801', () {
      const input = '2801';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'ezrx4u@zuelligpharma.com');
    });
    test('Should Return ezrx4u@zuelligpharma.com when Sales org 2802', () {
      const input = '2802';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'ezrx4u@zuelligpharma.com');
    });
    test('Should Return ezrx4u@zuelligpharma.com when Sales org 2803', () {
      const input = '2803';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'ezrx4u@zuelligpharma.com');
    });
    test('Should Return ezrx4u@zuelligpharma.com when Sales org 2804', () {
      const input = '2804';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'ezrx4u@zuelligpharma.com');
    });
    test('Should Return ezrx4u@zuelligpharma.com when Sales org 2805', () {
      const input = '2805';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'ezrx4u@zuelligpharma.com');
    });
    test('Should Return ZPTH-CS-CRC@zuelligpharma.com when Sales org 2900', () {
      const input = '2900';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'ZPTH-CS-CRC@zuelligpharma.com');
    });
    test('Should Return ZPTH-CS-CRC@zuelligpharma.com when Sales org 2902', () {
      const input = '2902';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'ZPTH-CS-CRC@zuelligpharma.com');
    });
    test('Should Return dat.hang@ezrx.com.vn when Sales org 3070', () {
      const input = '3070';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'dat.hang@ezrx.com.vn');
    });
    test('Should Return dat.hang@ezrx.com.vn when Sales org 3000', () {
      const input = '3000';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'dat.hang@ezrx.com.vn');
    });
    test('Should Return dat.hang@ezrx.com.vn when Sales org 3001', () {
      const input = '3001';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'dat.hang@ezrx.com.vn');
    });
    test('Should Return dat.hang@ezrx.com.vn when Sales org 3050', () {
      const input = '3050';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'dat.hang@ezrx.com.vn');
    });
    test('Should Return dat.hang@ezrx.com.vn when Sales org 3072', () {
      const input = '3072';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'dat.hang@ezrx.com.vn');
    });
    test('Should Return dat.hang@ezrx.com.vn when Sales org 3090', () {
      const input = '3090';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'dat.hang@ezrx.com.vn');
    });
  });

  group('Contact Number value object', () {
    test('Should Return 1800883711 when Sales org 2001', () {
      const input = '2001';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '1800883711');
    });
    test('Should Return Phone +9519345524, when Sales org 2200', () {
      const input = '2200';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '+9519345524');
    });
    test('Should Return Phone +959797207000, when Sales org 2200', () {
      const input = '2200';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[1];
      expect(result, '+959797207000');
    });
    test('Should Return Phone +9519345524 when Sales org 2201', () {
      const input = '2201';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '+9519345524');
    });
    test('Should Return Phone +9519345524 when Sales org 2201', () {
      const input = '2201';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[1];
      expect(result, '+959797207000');
    });

    test('Should Return Phone +9519345524, when Sales org 2203', () {
      const input = '2203';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '+9519345524');
    });
    test('Should Return +959797207000, when Sales org 2203', () {
      const input = '2203';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[1];
      expect(result, '+959797207000');
    });

    test('Should Return +9519345524, when Sales org 2250', () {
      const input = '2250';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '+9519345524');
    });
    test('Should Return +959797207000, when Sales org 2250', () {
      const input = '2250';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[1];
      expect(result, '+959797207000');
    });

    test('Should Return Telephone Number: +63282366488 when Sales org 2500',
        () {
      const input = '2500';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '+63282366488');
    });

    test('Should Return 0284241228  when Sales org 2501', () {
      const input = '2501';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '0284241228');
    });
    test('Should Return 0495598120 when Sales org 2501', () {
      const input = '2501';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[1];
      expect(result, '0495598120');
    });
    test('09190560455 when Sales org 2501', () {
      const input = '2501';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[2];
      expect(result, '09190560455');
    });

    test('Should Return +6565483190 when Sales org 2601', () {
      const input = '2601';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '+6565483190');
    });

    test('Should Return 0809090887 when Sales org 2800', () {
      const input = '2800';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '0809090887');
    });

    test('Should Return 0809090887 when Sales org 2801', () {
      const input = '2801';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '0809090887');
    });

    test('Should Return 0809090887 when Sales org 2802', () {
      const input = '2802';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '0809090887');
    });

    test('Should Return 0809090887 when Sales org 2803', () {
      const input = '2803';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '0809090887');
    });

    test('Should Return 0809090887 when Sales org 2804', () {
      const input = '2804';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '0809090887');
    });

    test('Should Return 0809090887 when Sales org 2805', () {
      const input = '2805';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '0809090887');
    });

    test('Should Return +6621231000 when Sales org 2900', () {
      const input = '2900';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '+6621231000');
    });
    test('Should Return 1800500000 when Sales org 2900', () {
      const input = '2900';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[1];
      expect(result, '1800500000');
    });

    test('Should Return +6621231000 when Sales org 2902', () {
      const input = '2902';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '+6621231000');
    });
    test('Should Return 1800500000 when Sales org 2902', () {
      const input = '2902';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[1];
      expect(result, '1800500000');
    });

    test('Should Return  1800555558  when Sales org 3070', () {
      const input = '3070';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '1800555558');
    });

    test('Should Return 1800555558  when Sales org 3000', () {
      const input = '3000';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '1800555558');
    });

    test('1800555558 when Sales org 3001', () {
      const input = '3001';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '1800555558');
    });

    test('1800555558 when Sales org 3050', () {
      const input = '3050';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '1800555558');
    });

    test('Should Return 1800555558 when Sales org 3072', () {
      const input = '3072';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '1800555558');
    });

    test('Should Return 1800555558 when Sales org 3090', () {
      const input = '3090';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result, '1800555558');
    });
  });

  group('Contact name value object', () {
    test('Should Return My eZRx Support Team when Sales org 2001', () {
      const input = '2001';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'My eZRx Support Team');
    });
    test('Should Return Mr Zin Ko Htay, Trade Sales Team when Sales org 2200',
        () {
      const input = '2200';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'Mr Zin Ko Htay, Trade Sales Team');
    });
    test('Should Return Mr Zin Ko Htay, Trade Sales Team when Sales org 2201',
        () {
      const input = '2201';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'Mr Zin Ko Htay, Trade Sales Team');
    });

    test('Should Return Mr Zin Ko Htay, Trade Sales Team when Sales org 2203',
        () {
      const input = '2203';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'Mr Zin Ko Htay, Trade Sales Team');
    });

    test('Should Return Mr Zin Ko Htay, Trade Sales Team when Sales org 2250',
        () {
      const input = '2250';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'Mr Zin Ko Htay, Trade Sales Team');
    });

    test('Should Return ZPC Customer Service when Sales org 2500', () {
      const input = '2500';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'ZPC Customer Service');
    });

    test('Should Return MDI Customer Service when Sales org 2501', () {
      const input = '2501';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'MDI Customer Service');
    });

    test('Should Return SG Customer Support when Sales org 2601', () {
      const input = '2601';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'SG Customer Support');
    });

    test('Should Return eZRx Service Team when Sales org 2800', () {
      const input = '2800';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'eZRx Service Team');
    });

    test('Should Return eZRx Service Team when Sales org 2801', () {
      const input = '2801';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'eZRx Service Team');
    });

    test('Should Return eZRx Service Team when Sales org 2802', () {
      const input = '2802';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'eZRx Service Team');
    });

    test('Should Return eZRx Service Team when Sales org 2803', () {
      const input = '2803';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'eZRx Service Team');
    });

    test('Should Return eZRx Service Team when Sales org 2804', () {
      const input = '2804';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'eZRx Service Team');
    });

    test('Should ReturneZRx Service Team when Sales org 2805', () {
      const input = '2805';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'eZRx Service Team');
    });

    test('Should Return ZP Thailand Customer Support when Sales org 2900', () {
      const input = '2900';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'ZP Thailand Customer Support');
    });

    test('Should Return ZP Thailand Customer Support when Sales org 2902', () {
      const input = '2902';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'ZP Thailand Customer Support');
    });

    test(
        'Should Return Ty TNHH Thương Mại và Dược Phẩm Sang when Sales org 3070',
        () {
      const input = '3070';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'Ty TNHH Thương Mại và Dược Phẩm Sang');
    });

    test(
        'Should Return Ty TNHH Thương Mại và Dược Phẩm Sang when Sales org 3000',
        () {
      const input = '3000';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'Ty TNHH Thương Mại và Dược Phẩm Sang');
    });

    test(
        'Should Return Ty TNHH Thương Mại và Dược Phẩm Sang when Sales org 3001',
        () {
      const input = '3001';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'Ty TNHH Thương Mại và Dược Phẩm Sang');
    });

    test(
        'Should Return Ty TNHH Thương Mại và Dược Phẩm Sang when Sales org 3050',
        () {
      const input = '3050';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'Ty TNHH Thương Mại và Dược Phẩm Sang');
    });

    test(
        'Should Return Ty TNHH Thương Mại và Dược Phẩm Sang when Sales org 3072',
        () {
      const input = '3072';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'Ty TNHH Thương Mại và Dược Phẩm Sang');
    });

    test(
        'Should Return Ty TNHH Thương Mại và Dược Phẩm Sang when Sales org 3090',
        () {
      const input = '3090';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'Ty TNHH Thương Mại và Dược Phẩm Sang');
    });
  });
}
