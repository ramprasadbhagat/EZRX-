import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SalesOrg value object', () {
    test(
      'should return ISPI when get BU Name with SalesOrg 2504',
      () async {
        const input = '2504';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.buName;
        expect(result, 'ISPI PH');
      },
    );
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
      'should return 2504 - ISPI PH when get Full Name with SalesOrg 2504',
      () async {
        const input = '2504';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.fullName;
        expect(result, '2504 - ISPI PH');
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
        expect(salesOrg.isTW, true);
      },
    );

    test(
      'should return PH when get country with SalesOrg 2504',
      () async {
        const input = '2504';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.country;
        expect(result, 'PH');
        expect(salesOrg.isPH, true);
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

    test(
      'should return PH when get country with SalesOrg 2500',
      () async {
        const input = '2500';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.country;
        expect(result, 'PH');
        expect(salesOrg.isPH, true);
      },
    );

    test(
      'should return PH when get country with SalesOrg 2500',
      () async {
        const input = '2601';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.locale;
        expect(result, const Locale('en', 'SG'));
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
      'should return true when role type is zp admin',
      () async {
        const input = 'zp_admin';
        final roleType = RoleType(input);
        final result = roleType.isZPAdmin;
        expect(result, true);
      },
    );

    test(
      'should return false when role type is not zp admin',
      () async {
        const input = 'root_admin';
        final roleType = RoleType(input);
        final result = roleType.isZPAdmin;
        expect(result, false);
      },
    );

    test(
      'should return true when role type is Root Admin',
      () async {
        const input = 'root_admin';
        final roleType = RoleType(input);
        final result = roleType.isRootAdmin;
        expect(result, true);
      },
    );

    test(
      'should return false when role type is not Root Admin',
      () async {
        const input = 'zp_admin';
        final roleType = RoleType(input);
        final result = roleType.isRootAdmin;
        expect(result, false);
      },
    );

    test(
      'should return true when user is eligible login role for ZPAdmin',
      () async {
        const input = 'external_sales_rep';
        final roleType = RoleType(input);
        final result = roleType.isEligibleLoginRoleForZPAdmin;
        expect(result, true);
      },
    );

    test(
      'should return false when user is not eligible login role for ZPAdmin',
      () async {
        const input = 'zp_admin';
        final roleType = RoleType(input);
        final result = roleType.isEligibleLoginRoleForZPAdmin;
        expect(result, false);
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
        final result = roleType.isSalesRepRole;
        expect(result, true);
      },
    );

    test(
      'should return salesRep when check login user type with External Sales Rep role',
      () async {
        const input = 'external_sales_rep';
        final roleType = RoleType(input);
        final result = roleType.isSalesRepRole;
        expect(result, true);
      },
    );

    test(
      'should return client when check login user type with Client user role',
      () async {
        const input = 'client_user';
        final roleType = RoleType(input);
        final result = roleType.isCustomer;
        expect(result, true);
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
        final result = salesRep.isSalesRepRole;
        expect(result, true);
      },
    );

    test(
      'should return true when user userType is external_sales_rep',
      () async {
        const input = 'external_sales_rep';
        final salesRep = RoleType(input);
        final result = salesRep.isSalesRepRole;
        expect(result, true);
      },
    );

    test(
      'should return false when user userType is some dummy',
      () async {
        const input = 'dummy';
        final salesRep = RoleType(input);
        final result = salesRep.isSalesRepRole;
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
          'Should Return customerservice@interpharmasolutions.com when Sales org 2504',
          () {
        const input = '2504';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactEmail;
        expect(result, 'customerservice@interpharmasolutions.com');
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
        expect(result.getOrCrash(), '1800883711');
      });
      test('Should Return Phone +9519345524, when Sales org 2200', () {
        const input = '2200';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '+9519345524');
      });
      test('Should Return Phone +959797207000, when Sales org 2200', () {
        const input = '2200';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[1];
        expect(result.getOrCrash(), '+959797207000');
      });
      test('Should Return Phone +9519345524 when Sales org 2201', () {
        const input = '2201';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '+9519345524');
      });
      test('Should Return Phone +9519345524 when Sales org 2201', () {
        const input = '2201';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[1];
        expect(result.getOrCrash(), '+959797207000');
      });

      test('Should Return Phone +9519345524, when Sales org 2203', () {
        const input = '2203';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '+9519345524');
      });
      test('Should Return +959797207000, when Sales org 2203', () {
        const input = '2203';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[1];
        expect(result.getOrCrash(), '+959797207000');
      });

      test('Should Return +9519345524, when Sales org 2250', () {
        const input = '2250';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '+9519345524');
      });
      test('Should Return +959797207000, when Sales org 2250', () {
        const input = '2250';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[1];
        expect(result.getOrCrash(), '+959797207000');
      });

      test('Should Return Telephone Number: +63282366488 when Sales org 2500',
          () {
        const input = '2500';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '+63282366488');
      });

      test('Should Return Telephone Number: +6329082222 when Sales org 2504',
          () {
        const input = '2504';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '+6329082222');
      });

      test('Should Return 0284241228  when Sales org 2501', () {
        const input = '2501';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '0284241228');
      });
      test('Should Return 0495598120 when Sales org 2501', () {
        const input = '2501';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[1];
        expect(result.getOrCrash(), '0495598120');
      });
      test('09190560455 when Sales org 2501', () {
        const input = '2501';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[2];
        expect(result.getOrCrash(), '09190560455');
      });

      test('Should Return +6565483190 when Sales org 2601', () {
        const input = '2601';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '+6565483190');
      });

      test('Should Return 0809090887 when Sales org 2800', () {
        const input = '2800';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '0809090887');
      });

      test('Should Return 0809090887 when Sales org 2801', () {
        const input = '2801';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '0809090887');
      });

      test('Should Return 0809090887 when Sales org 2802', () {
        const input = '2802';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '0809090887');
      });

      test('Should Return 0809090887 when Sales org 2803', () {
        const input = '2803';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '0809090887');
      });

      test('Should Return 0809090887 when Sales org 2804', () {
        const input = '2804';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '0809090887');
      });

      test('Should Return 0809090887 when Sales org 2805', () {
        const input = '2805';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '0809090887');
      });

      test('Should Return +6621231000 when Sales org 2900', () {
        const input = '2900';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '+6621231000');
      });
      test('Should Return 1800500000 when Sales org 2900', () {
        const input = '2900';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[1];
        expect(result.getOrCrash(), '1800500000');
      });

      test('Should Return +6621231000 when Sales org 2902', () {
        const input = '2902';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '+6621231000');
      });
      test('Should Return 1800500000 when Sales org 2902', () {
        const input = '2902';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[1];
        expect(result.getOrCrash(), '1800500000');
      });

      test('Should Return  1800555558  when Sales org 3070', () {
        const input = '3070';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '1800555558');
      });

      test('Should Return 1800555558  when Sales org 3000', () {
        const input = '3000';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '1800555558');
      });

      test('1800555558 when Sales org 3001', () {
        const input = '3001';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '1800555558');
      });

      test('1800555558 when Sales org 3050', () {
        const input = '3050';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '1800555558');
      });

      test('Should Return 1800555558 when Sales org 3072', () {
        const input = '3072';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '1800555558');
      });

      test('Should Return 1800555558 when Sales org 3090', () {
        const input = '3090';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contact.phoneNumbers[0];
        expect(result.getOrCrash(), '1800555558');
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

      test('Should Return ISPI Customer Service when Sales org 2504', () {
        const input = '2504';
        final salesOrg = SalesOrg(input);
        final result = salesOrg.contactPersonName;
        expect(result, 'ISPI Customer Service');
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

    test(
        'Should Return customerservice@interpharmasolutions.com when Sales org 2504',
        () {
      const input = '2504';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactEmail;
      expect(result, 'customerservice@interpharmasolutions.com');
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
      expect(result.getOrCrash(), '1800883711');
    });
    test('Should Return Phone +9519345524, when Sales org 2200', () {
      const input = '2200';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '+9519345524');
    });
    test('Should Return Phone +959797207000, when Sales org 2200', () {
      const input = '2200';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[1];
      expect(result.getOrCrash(), '+959797207000');
    });
    test('Should Return Phone +9519345524 when Sales org 2201', () {
      const input = '2201';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '+9519345524');
    });
    test('Should Return Phone +9519345524 when Sales org 2201', () {
      const input = '2201';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[1];
      expect(result.getOrCrash(), '+959797207000');
    });

    test('Should Return Phone +9519345524, when Sales org 2203', () {
      const input = '2203';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '+9519345524');
    });
    test('Should Return +959797207000, when Sales org 2203', () {
      const input = '2203';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[1];
      expect(result.getOrCrash(), '+959797207000');
    });

    test('Should Return +9519345524, when Sales org 2250', () {
      const input = '2250';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '+9519345524');
    });
    test('Should Return +959797207000, when Sales org 2250', () {
      const input = '2250';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[1];
      expect(result.getOrCrash(), '+959797207000');
    });

    test('Should Return Telephone Number: +63282366488 when Sales org 2500',
        () {
      const input = '2500';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '+63282366488');
    });

    test('Should Return 0284241228  when Sales org 2501', () {
      const input = '2501';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '0284241228');
    });
    test('Should Return 0495598120 when Sales org 2501', () {
      const input = '2501';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[1];
      expect(result.getOrCrash(), '0495598120');
    });
    test('09190560455 when Sales org 2501', () {
      const input = '2501';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[2];
      expect(result.getOrCrash(), '09190560455');
    });

    test('+6329082222 when Sales org 2504', () {
      const input = '2504';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '+6329082222');
    });

    test('Should Return +6565483190 when Sales org 2601', () {
      const input = '2601';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '+6565483190');
    });

    test('Should Return 0809090887 when Sales org 2800', () {
      const input = '2800';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '0809090887');
    });

    test('Should Return 0809090887 when Sales org 2801', () {
      const input = '2801';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '0809090887');
    });

    test('Should Return 0809090887 when Sales org 2802', () {
      const input = '2802';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '0809090887');
    });

    test('Should Return 0809090887 when Sales org 2803', () {
      const input = '2803';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '0809090887');
    });

    test('Should Return 0809090887 when Sales org 2804', () {
      const input = '2804';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '0809090887');
    });

    test('Should Return 0809090887 when Sales org 2805', () {
      const input = '2805';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '0809090887');
    });

    test('Should Return +6621231000 when Sales org 2900', () {
      const input = '2900';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '+6621231000');
    });
    test('Should Return 1800500000 when Sales org 2900', () {
      const input = '2900';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[1];
      expect(result.getOrCrash(), '1800500000');
    });

    test('Should Return +6621231000 when Sales org 2902', () {
      const input = '2902';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '+6621231000');
    });
    test('Should Return 1800500000 when Sales org 2902', () {
      const input = '2902';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[1];
      expect(result.getOrCrash(), '1800500000');
    });

    test('Should Return  1800555558  when Sales org 3070', () {
      const input = '3070';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '1800555558');
    });

    test('Should Return 1800555558  when Sales org 3000', () {
      const input = '3000';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '1800555558');
    });

    test('1800555558 when Sales org 3001', () {
      const input = '3001';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '1800555558');
    });

    test('1800555558 when Sales org 3050', () {
      const input = '3050';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '1800555558');
    });

    test('Should Return 1800555558 when Sales org 3072', () {
      const input = '3072';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '1800555558');
    });

    test('Should Return 1800555558 when Sales org 3090', () {
      const input = '3090';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contact.phoneNumbers[0];
      expect(result.getOrCrash(), '1800555558');
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

    test('Should Return ISPI Customer Service when Sales org 2504', () {
      const input = '2504';
      final salesOrg = SalesOrg(input);
      final result = salesOrg.contactPersonName;
      expect(result, 'ISPI Customer Service');
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

  group('Oos value object', () {
    test(
      'should return true when value is 0',
      () async {
        const input = 0;
        final oosValue = OosValue(input);
        final result = oosValue.isOosValueZero;
        expect(result, true);
      },
    );

    test(
      'should return false when value is not 0',
      () async {
        const input = 1;
        final oosValue = OosValue(input);
        final result = oosValue.isOosValueZero;
        expect(result, false);
      },
    );

    group('RoleName value object', () {
      test(
        'should return external_sales_rep when user role type is External Sales Rep',
        () async {
          const input = 'External Sales Rep';
          final roleName = RoleName(input);
          final result = roleName.getRoleType;
          expect(result, 'external_sales_rep');
        },
      );

      test(
        'should return Unknown when user role type is not known',
        () async {
          const input = 'Unknown user';
          final roleName = RoleName(input);
          final result = roleName.getRoleType;
          expect(result, 'Unknown');
        },
      );

      test(
        'should return true when user is eligible login role for ZPAdmin',
        () async {
          const input = 'External Sales Rep';
          final roleName = RoleName(input);
          final result = roleName.isEligibleLoginRoleForZPAdmin;
          expect(result, true);
        },
      );

      test(
        'should return false when user is not eligible login role for ZPAdmin',
        () async {
          const input = 'Return Approver';
          final roleName = RoleName(input);
          final result = roleName.isEligibleLoginRoleForZPAdmin;
          expect(result, false);
        },
      );
    });
  });

  group('FutureDeliveryDay value object', () {
    test(
      'should return value when user future delivery date is not empty and valid',
      () async {
        const input = '5';
        final value = FutureDeliveryDay(input);
        final result = value.getOrCrash();
        expect(result, input);
        expect(value.isValid(), true);
        expect(value.validatedFutureDeliveryDate, '5');
      },
    );

    test(
      'should return empty value when user future delivery date is empty',
      () async {
        const input = '';
        final value = FutureDeliveryDay(input);
        final result = value.getOrDefaultValue('');
        expect(result, input);
        expect(value.isValid(), false);
        expect(value.validatedFutureDeliveryDate, '');
      },
    );

    test(
      'should return empty value when user future delivery date is not empty but data is has a dash',
      () async {
        const input = '-';
        final value = FutureDeliveryDay(input);
        final result = value.getOrDefaultValue('');
        expect(result, input);
        expect(value.isValid(), true);
        expect(value.validatedFutureDeliveryDate, '');
      },
    );
  });
}
