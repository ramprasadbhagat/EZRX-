import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';

void main() {
  group('validateMaxStringLength', () {
    test(
      'should return the original input String when represents a valid input',
      () async {
        const input = 'APPLE';
        final result = validateMaxStringLength(input, 6);
        expect(result, const Right(input));
      },
    );

    test(
      'should return the original input String when represents a empty input',
      () async {
        const input = '';
        final result = validateMaxStringLength(input, 6);
        expect(result, const Right(input));
      },
    );

    test(
      'should return the original input line enter when represents a line enter input',
      () async {
        const input = '\n';
        final result = validateMaxStringLength(input, 6);
        expect(result, const Right(input));
      },
    );

    test(
      'should return failure when the string is excced the maximum length',
      () async {
        const input = 'APPLEPIE';
        final result = validateMaxStringLength(input, 6);
        expect(
          result,
          const Left(ValueFailure.exceedingLength(failedValue: input, max: 6)),
        );
      },
    );

    test(
      'should return failure when the string is excced the maximum length',
      () async {
        const input = 'APPLE\nPIE';
        final result = validateMaxStringLength(input, 6);
        expect(
          result,
          const Left(ValueFailure.exceedingLength(failedValue: input, max: 6)),
        );
      },
    );
  });

  group('validateStringNotEmpty', () {
    test(
      'should return the original input String when represents a valid input',
      () async {
        const input = 'APPLE';
        final result = validateStringNotEmpty(input);
        expect(result, const Right(input));
      },
    );
    test(
      'should return the original input email when represents a valid input',
      () async {
        const input = 'test@zuelligpharma.com';
        final result = validateStringNotEmpty(input);
        expect(result, const Right(input));
      },
    );

    test(
      'should return the original input line enter when represents a line enter input',
      () async {
        const input = '\n';
        final result = validateStringNotEmpty(input);
        expect(result, const Right(input));
      },
    );

    test(
      'should return failure when the string is empty',
      () async {
        const input = '';
        final result = validateStringNotEmpty(input);
        expect(result, const Left(ValueFailure.empty(failedValue: input)));
      },
    );
  });

  group('validateSingleLine', () {
    test(
      'should return the original input String when represents a valid input',
      () async {
        const input = 'APPLE is very nice';
        final result = validateSingleLine(input);
        expect(result, const Right(input));
      },
    );
    test(
      'should return the original input Email List when represents a valid input',
      () async {
        const input = 'test@zuelligpharma.com, test2@zuelligpharma.com.';
        final result = validateSingleLine(input);
        expect(result, const Right(input));
      },
    );

    test(
      'should return failure when the string contain line enter',
      () async {
        const input = 'Hi,\nhere is ezrx support';
        final result = validateSingleLine(input);
        expect(result, const Left(ValueFailure.multiline(failedValue: input)));
      },
    );

    test(
      'should return failure when the string contain more line enter',
      () async {
        const input = 'Please,\ncontect our support support@ezrx.com\n';
        final result = validateSingleLine(input);
        expect(result, const Left(ValueFailure.multiline(failedValue: input)));
      },
    );
  });

  group('validateEmailAddress', () {
    test(
      'should return the original input email when represents a valid input',
      () async {
        const input = 'test@zuelligpharma.com';
        final result = validateEmailAddress(input);
        expect(result, const Right(input));
      },
    );
    test(
      'should return the original input email when represents a valid input',
      () async {
        const input = 'abc@cc.xyz';
        final result = validateEmailAddress(input);
        expect(result, const Right(input));
      },
    );

    test(
      'should return failure when the string not match the email pattern',
      () async {
        const input = 'zzzcccc.com';
        final result = validateEmailAddress(input);
        expect(
            result, const Left(ValueFailure.invalidEmail(failedValue: input)));
      },
    );

    test(
      'should return failure when the string not match the email pattern',
      () async {
        const input = 'asdhjjahwd@ccc';
        final result = validateEmailAddress(input);
        expect(
            result, const Left(ValueFailure.invalidEmail(failedValue: input)));
      },
    );
  });

  group('validatePassword', () {
    test(
      'should return the original input password when represents a valid password format',
      () async {
        const input = '121@ddXX_123';
        final result = validatePassword(input);
        expect(result, const Right(input));
      },
    );
    test(
      'should return the original input password when represents a valid password format',
      () async {
        const input = 'Password@1235678';
        final result = validatePassword(input);
        expect(result, const Right(input));
      },
    );

    test(
      'should return failure when the input password not match the password pattern',
      () async {
        const input = 'zzxxxadasd123%%';
        final result = validatePassword(input);
        expect(
          result,
          const Left(
            ValueFailure.passwordNotMatchRequirements(failedValue: input),
          ),
        );
      },
    );

    test(
      'should return failure when the input password not match the password pattern',
      () async {
        const input = '2a2v2v';
        final result = validatePassword(input);
        expect(
          result,
          const Left(
            ValueFailure.passwordNotMatchRequirements(failedValue: input),
          ),
        );
      },
    );
  });
}
