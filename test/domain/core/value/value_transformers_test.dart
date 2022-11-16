import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/setting_tc.dart';
import 'package:ezrxmobile/domain/account/entities/settings.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('stringCapitalize', () {
    test(
      'should return an String capital on the first chracter, the reset will be in lower case',
      () async {
        const input = 'APPLE';
        final result = stringCapitalize(input);
        expect(result, 'Apple');
      },
    );

    test(
      'should return an String capital on the first chracter',
      () async {
        const input = 'orange';
        final result = stringCapitalize(input);
        expect(result, 'Orange');
      },
    );

    test(
      'should return an String capital on the first chracter, the reset will be in lower case',
      () async {
        const input = 'Zuellig Pharma';
        final result = stringCapitalize(input);
        expect(result, 'Zuellig pharma');
      },
    );
  });

  group('stringTitleCase', () {
    test(
      'should return an String with title case',
      () async {
        const input = 'APPLE CARE';
        final result = stringTitleCase(input);
        expect(result, 'Apple Care');
      },
    );

    test(
      'should return an String with title case',
      () async {
        const input = 'orange juice';
        final result = stringTitleCase(input);
        expect(result, 'Orange Juice');
      },
    );

    test(
      'should return an String with title case',
      () async {
        const input = 'Zuellig Pharma';
        final result = stringTitleCase(input);
        expect(result, 'Zuellig Pharma');
      },
    );
  });

  group('removeLeadingZero', () {
    test(
      'should return an String without zero',
      () async {
        const input = '000123';
        final result = removeLeadingZero(input);
        expect(result, '123');
      },
    );

    test(
      'should return an String without zero',
      () async {
        const input = '0234';
        final result = removeLeadingZero(input);
        expect(result, '234');
      },
    );

    test(
      'should return an String without zero',
      () async {
        const input = '45456';
        final result = removeLeadingZero(input);
        expect(result, '45456');
      },
    );
  });

  group('naIfEmpty', () {
    test(
      'should return an NA if is empty String',
      () async {
        const input = '';
        final result = naIfEmpty(input);
        expect(result, 'NA');
      },
    );

    test(
      'should return an String if not empty String',
      () async {
        const input = '0234';
        final result = naIfEmpty(input);
        expect(result, '0234');
      },
    );

    test(
      'should return an String if not empty String',
      () async {
        const input = 'ccc213fa';
        final result = naIfEmpty(input);
        expect(result, 'ccc213fa');
      },
    );
  });

  group('isMinTenCharacter', () {
    test(
      'should return boolean true when input String is minimum n character long',
      () async {
        const input = 'APPLE CARE';
        final result = isMinCharacter(input: input, minLength: 6);
        expect(result, true);
      },
    );

    test(
      'should return boolean true when input String is minimum n character long containing a new line',
      () async {
        const input = 'APPLE\nCARE';
        final result = isMinCharacter(input: input, minLength: 10);
        expect(result, true);
      },
    );

    test(
      'should return boolean false when input String is empty',
      () async {
        const input = '';
        final result = isMinCharacter(input: input, minLength: 6);
        expect(result, false);
      },
    );

    test(
      'should return boolean false when input String is less than minimum length',
      () async {
        const input = 'Zuellig Pharma';
        final result = isMinCharacter(input: input, minLength: 16);
        expect(result, false);
      },
    );
  });

  group('isAtleastOneLowerCharacter', () {
    test(
      'should return boolean true when input String is atleast one lower case character',
      () async {
        const input = 'ApPLE CARE';
        final result = isAtleastOneLowerCharacter(
          input: input,
        );
        expect(result, true);
      },
    );

    test(
      'should return boolean false when input String is empty',
      () async {
        const input = '';
        final result = isAtleastOneLowerCharacter(
          input: input,
        );
        expect(result, false);
      },
    );

    test(
      'should return boolean false when input String does not contain any lower case character',
      () async {
        const input = 'APPLE';
        final result = isAtleastOneLowerCharacter(
          input: input,
        );
        expect(result, false);
      },
    );
  });

  group('isAtleastOneUpperCharacter', () {
    test(
      'should return boolean true when input String is atleast one upper case character',
      () async {
        const input = 'Apple';
        final result = isAtleastOneUpperCharacter(
          input: input,
        );
        expect(result, true);
      },
    );

    test(
      'should return boolean false when input String is empty',
      () async {
        const input = '';
        final result = isAtleastOneUpperCharacter(
          input: input,
        );
        expect(result, false);
      },
    );

    test(
      'should return boolean false when input String does not contain any upper case character',
      () async {
        const input = 'apple';
        final result = isAtleastOneUpperCharacter(
          input: input,
        );
        expect(result, false);
      },
    );
  });

  group('isAtleastOneNumericCharacter', () {
    test(
      'should return boolean true when input String is atleast one numeric case character',
      () async {
        const input = 'Apple1';
        final result = isAtleastOneNumericCharacter(
          input: input,
        );
        expect(result, true);
      },
    );

    test(
      'should return boolean false when input String is empty',
      () async {
        const input = '';
        final result = isAtleastOneNumericCharacter(
          input: input,
        );
        expect(result, false);
      },
    );

    test(
      'should return boolean false when input String does not contain any numeric character',
      () async {
        const input = 'apple';
        final result = isAtleastOneNumericCharacter(
          input: input,
        );
        expect(result, false);
      },
    );
  });

  group('isAtleastOneSpecialCharacter', () {
    test(
      'should return boolean true when input String is atleast one special character',
      () async {
        const input = 'Apple@1';
        final result = isAtleastOneSpecialCharacter(
          input: input,
        );
        expect(result, true);
      },
    );

    test(
      'should return boolean false when input String is empty',
      () async {
        const input = '';
        final result = isAtleastOneSpecialCharacter(
          input: input,
        );
        expect(result, false);
      },
    );

    test(
      'should return boolean false when input String does not contain any special character',
      () async {
        const input = 'apple';
        final result = isAtleastOneSpecialCharacter(
          input: input,
        );
        expect(result, false);
      },
    );
  });

  group('isMustNotContainUserNameOrName', () {
    test(
      'should return boolean true when input String must not contain username Or name',
      () async {
        const input = 'Apple@1';
        final user = User(
          id: '1',
          username: Username('choo'),
          email: EmailAddress('abc@gmail.com'),
          fullName: const FullName(firstName: 'dipankar', lastName: 'das'),
          role: Role(
              id: '2',
              description: 'Developer',
              name: 'abc',
              type: RoleType('Developer')),
          customerCode: CustomerCode('2606'),
          userSalesOrganisations: [],
          settings: Settings.empty(),
          settingTc: SettingTc.empty(),
          enableOrderType: false,
        );
        final result = isMustNotContainUserNameOrName(input: input, user: user);
        expect(result, true);
      },
    );

    test(
      'should return failure when input contains name (first name)',
      () async {
        const input = 'Appledipankar@2022';
        final user = User(
          id: '1',
          username: Username('choo'),
          email: EmailAddress('abc@gmail.com'),
          fullName: const FullName(firstName: 'dipankar', lastName: 'das'),
          role: Role(
              id: '2',
              description: 'Developer',
              name: 'abc',
              type: RoleType('Developer')),
          customerCode: CustomerCode('2606'),
          userSalesOrganisations: [],
          settings: Settings.empty(),
          settingTc: SettingTc.empty(),
          enableOrderType: false,
        );
        final result = isMustNotContainUserNameOrName(input: input, user: user);
        expect(result, false);
      },
    );

    test(
      'should return failure when input contains name (last name)',
      () async {
        const input = 'Appledas@2022';
        final user = User(
          id: '1',
          username: Username('choo'),
          email: EmailAddress('abc@gmail.com'),
          fullName: const FullName(firstName: 'dipankar', lastName: 'das'),
          role: Role(
              id: '2',
              description: 'Developer',
              name: 'abc',
              type: RoleType('Developer')),
          customerCode: CustomerCode('2606'),
          userSalesOrganisations: [],
          settings: Settings.empty(),
          settingTc: SettingTc.empty(),
          enableOrderType: false,
        );
        final result = isMustNotContainUserNameOrName(input: input, user: user);
        expect(result, false);
      },
    );

    test(
      'should return failure when input contains name (username)',
      () async {
        const input = 'Applechoo@2022';
        final user = User(
          id: '1',
          username: Username('choo'),
          email: EmailAddress('abc@gmail.com'),
          fullName: const FullName(firstName: 'dipankar', lastName: 'das'),
          role: Role(
              id: '2',
              description: 'Developer',
              name: 'abc',
              type: RoleType('Developer')),
          customerCode: CustomerCode('2606'),
          userSalesOrganisations: [],
          settings: Settings.empty(),
          settingTc: SettingTc.empty(),
          enableOrderType: false,
        );
        final result = isMustNotContainUserNameOrName(input: input, user: user);
        expect(result, false);
      },
    );
  });
}
