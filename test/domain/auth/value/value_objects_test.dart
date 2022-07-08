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
}
