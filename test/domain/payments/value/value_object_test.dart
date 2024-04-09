import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PaymentDue value object', () {
    test(
      'get total mount string from payment due success',
      () async {
        const input = 'MYR 18940.000000';
        final paymentDue = PaymentDue(input);
        final result = paymentDue.totalAmount;
        expect(result, '18,940.00');
      },
    );

    test(
      'get total mount from payment due failure with invalid payment due string',
      () async {
        const input = '18940.000000 MYR';
        final paymentDue = PaymentDue(input);
        final result = paymentDue.totalAmount;
        expect(result, '0.00');
      },
    );
  });

  group('AdviceExpiryValue value object', () {
    test(
      'get expiry days from advice expiry success',
      () async {
        const input = '15 days';
        final adviceExpiry = AdviceExpiryValue(input);
        final result = adviceExpiry.expiryDays;
        expect(result, 15);
      },
    );

    test(
      'get expiry days from advice expiry failure with advice expiry due string',
      () async {
        const input = 'in 15 days';
        final adviceExpiry = AdviceExpiryValue(input);
        final result = adviceExpiry.expiryDays;
        expect(result, 0);
      },
    );

    test(
      'display dash if empty',
      () async {
        const input = '';
        final adviceExpiry = AdviceExpiryValue(input);
        final result = adviceExpiry.displayDashIfEmpty;
        expect(result, '-');
      },
    );
  });

  group('DebitCreditCode value object', () {
    test(
      'check is credit',
      () async {
        const input = 'H';
        final adviceExpiry = DebitCreditCode(input);
        final result = adviceExpiry.isCredit;
        expect(result, true);
      },
    );

    test(
      'check is debit',
      () async {
        const input = 'S';
        final adviceExpiry = DebitCreditCode(input);
        final result = adviceExpiry.isDedit;
        expect(result, true);
      },
    );
  });

  group('ReferenceId value object', () {
    test(
      'get reference list string',
      () async {
        const input = '0000100585,0000100585';
        final adviceExpiry = ReferenceId(input);
        final result = adviceExpiry.referenceListString;
        expect(result, '#0000100585, #0000100585');
      },
    );

    test(
      'get reference list string when data is empty',
      () => expect(ReferenceId('').referenceListString, '-'),
    );
  });
}
