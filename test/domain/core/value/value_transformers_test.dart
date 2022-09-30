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
}
