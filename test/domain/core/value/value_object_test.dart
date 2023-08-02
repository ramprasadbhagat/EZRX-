import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StringValue Value Object', () {
    test(
      'StringValue display dash If Empty',
      () {
        final valObj = StringValue('');
        expect(
          valObj.displayDashIfEmpty,
          '-',
        );
      },
    );
    test(
      'StringValue display NA If Empty',
      () {
        final valObj = StringValue('');
        expect(
          valObj.displayNAIfEmpty,
          'NA',
        );
      },
    );
  });

  group('IntegerValue Value Object', () {
    test(
      'IntegerValue display integer when input is double ',
      () {
        final valObj = IntegerValue('1.000');
        expect(
          valObj.apiParameterValue,
          '1',
        );
      },
    );

    test(
      'IntegerValue display empty when input is 0 ',
      () {
        final valObj = IntegerValue('0');
        expect(
          valObj.apiParameterValue,
          '',
        );
      },
    );

    test(
      'IntegerValue display empty when input is empty ',
      () {
        final valObj = IntegerValue('');
        expect(
          valObj.apiParameterValue,
          '',
        );
      },
    );
  });
}
