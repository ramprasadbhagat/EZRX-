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
}
