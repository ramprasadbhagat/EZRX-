import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  
  group('StringValue Value Object', () {
    test(
      'StringValue display dash If Empty',
      () {
        final valObj = StringValue('');
        expect(
          valObj.displayStringValue,
          '-',
        );
      },
    );
    test(
      'StringValue display NA If Empty',
      () {
        final valObj = StringValue('');
        expect(
          valObj.displayLabel,
          'NA',
        );
      },
    );

    test(
      'StringValue display black color when input is N.A. ',
      () {
        final valObj = StringValue('N.A.');
        expect(
          valObj.getPaymentAdviceColor,
          ZPColors.black,
        );
      },
    );
    test(
      'StringValue display red color when input not equal N.A. ',
      () {
        final valObj = StringValue('any-string');
        expect(
          valObj.getPaymentAdviceColor,
          ZPColors.red,
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
