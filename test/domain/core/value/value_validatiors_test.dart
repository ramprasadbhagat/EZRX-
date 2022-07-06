import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';

void main() {
  group('stringValidateMaxStringLength', () {
    test(
      'should return the original input String when represents a valid input',
      () async {
        const input = 'APPLE';
        final result = validateMaxStringLength(input, 6);
        expect(result, const Right('APPLE'));
      },
    );

    test(
      'should return failure when the string is excced the maximum length',
      () async {
        const input = 'APPLEPIE';
        final result = validateMaxStringLength(input, 6);
        expect(
          result,
          const Left(
            ValueFailure.exceedingLength(failedValue: 'APPLEPIE', max: 6),
          ),
        );
      },
    );

    test(
      'should return the original input String when represents a empty input',
      () async {
        const input = '';
        final result = validateMaxStringLength(input, 6);
        expect(result, const Right(''));
      },
    );
  });
}
