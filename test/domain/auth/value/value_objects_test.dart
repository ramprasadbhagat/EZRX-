import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Username value object', () {
    test(
      'should return true when username is Valid',
      () async {
        const input = 'APPLE';
        final username = Username(input);
        final result = username.isValid();
        expect(result, true);
      },
    );

    test(
      'should return an same input if the value is valid',
      () async {
        const input = 'Orange';
        final username = Username(input);
        final result = username.getOrCrash();
        expect(result, input);
      },
    );

    test(
      'should return error message when the username is empty',
      () async {
        const errorMessage = 'Username cannot be empty';
        const input = '';
        final username = Username(input);
        final result = username.value.fold(
          (f) => f.maybeMap(
            empty: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );

    test(
      'should return true when compare with same input object',
      () async {
        const input = 'Banana';
        final username = Username(input);
        const input2 = 'Banana';
        final username2 = Username(input2);
        final result = username == username2;
        expect(result, true);
      },
    );

    test(
      'should return false when compare with different input object',
      () async {
        const input = 'Orange';
        final username = Username(input);
        const input2 = 'Banana';
        final username2 = Username(input2);
        final result = username == username2;
        expect(result, false);
      },
    );
  });

  group('EmailAddress value object', () {
    test(
      'should return true when email is Valid',
      () async {
        const input = 'test@zuelligpharma.com';
        final email = EmailAddress(input);
        final result = email.isValid();
        expect(result, true);
      },
    );

    test(
      'should return an same input if the value is valid',
      () async {
        const input = 'support@google.com';
        final email = EmailAddress(input);
        final result = email.getOrCrash();
        expect(result, input);
      },
    );

    test(
      'should return error message when the email is empty',
      () async {
        const errorMessage = 'Email cannot be empty';
        const input = '';
        final email = EmailAddress(input);
        final result = email.value.fold(
          (f) => f.maybeMap(
            empty: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );

    test(
      'should return error message when the email is invalid',
      () async {
        const errorMessage = 'Email is invalid';
        const input = 'ccxx.com';
        final email = EmailAddress(input);
        final result = email.value.fold(
          (f) => f.maybeMap(
            invalidEmail: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );

    test(
      'should return true when compare with same input object',
      () async {
        const input = 'test@zuelligpharma.com';
        final email = EmailAddress(input);
        const input2 = 'test@zuelligpharma.com';
        final email2 = EmailAddress(input2);
        final result = email == email2;
        expect(result, true);
      },
    );

    test(
      'should return false when compare with different input object',
      () async {
        const input = 'test@zuelligpharma.com';
        final email = EmailAddress(input);
        const input2 = 'support@google.com';
        final email2 = EmailAddress(input2);
        final result = email == email2;
        expect(result, false);
      },
    );
  });

  group('Password for login value object', () {
    test(
      'should return true when password is valid format',
      () async {
        const input = 'abc1234';
        final password = Password.login(input);
        final result = password.isValid();
        expect(result, true);
      },
    );

    test(
      'should return an same input if the value is valid format',
      () async {
        const input = '456';
        final password = Password.login(input);
        final result = password.isValid();
        expect(result, true);
      },
    );

    test(
      'should return error message when the password is empty',
      () async {
        const errorMessage = 'Password cannot be empty';
        const input = '';
        final password = Password.login(input);
        final result = password.value.fold(
          (f) => f.maybeMap(
            empty: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );

    test(
      'should return true when compare with same input object',
      () async {
        const input = 'abc1234';
        final password = Password.login(input);
        const input2 = 'abc1234';
        final password2 = Password.login(input2);
        final result = password == password2;
        expect(result, true);
      },
    );

    test(
      'should return false when compare with different input object',
      () async {
        const input = 'abc1234';
        final password = Password.login(input);
        const input2 = '456';
        final password2 = Password.login(input2);
        final result = password == password2;
        expect(result, false);
      },
    );
  });

  group('Password for reset value object', () {
    test(
      'should return true when password is valid format',
      () async {
        const input = 'abc1234@cCc';
        final password = Password.reset(input);
        final result = password.isValid();
        expect(result, true);
      },
    );

    test(
      'should return an same input if the value is valid format',
      () async {
        const input = 'zz#134Dzzzaa';
        final password = Password.reset(input);
        final result = password.isValid();
        expect(result, true);
      },
    );

    test(
      'should return error message when the password is empty',
      () async {
        const errorMessage = 'Password cannot be empty';
        const input = '';
        final password = Password.reset(input);
        final result = password.value.fold(
          (f) => f.maybeMap(
            empty: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );

    test(
      'should return error message when the password is invalid',
      () async {
        const errorMessage = 'Password not match requirements';
        const input = 'abc1234';
        final password = Password.reset(input);
        final result = password.value.fold(
          (f) => f.maybeMap(
            passwordNotMatchRequirements: (_) => errorMessage,
            orElse: () => null,
          ),
          (_) => null,
        );
        expect(result, errorMessage);
      },
    );

    test(
      'should return true when compare with same input object',
      () async {
        const input = 'abc1234@cCc';
        final password = Password.reset(input);
        const input2 = 'abc1234@cCc';
        final password2 = Password.reset(input2);
        final result = password == password2;
        expect(result, true);
      },
    );

    test(
      'should return false when compare with different input object',
      () async {
        const input = 'abc1234@cCc';
        final password = Password.reset(input);
        const input2 = 'zz#134Dzzzaa';
        final password2 = Password.reset(input2);
        final result = password == password2;
        expect(result, false);
      },
    );
  });
}
