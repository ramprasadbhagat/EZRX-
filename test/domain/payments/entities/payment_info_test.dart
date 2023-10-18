import 'package:ezrxmobile/domain/payments/entities/customer_payment_info.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Payment Info', () {
    final paymentStatus = CustomerPaymentInfo.empty().copyWith(
      zzHtmcs: 'fake-zzHtmcs',
      paymentBatchAdditionalInfo: 'fake-Batch-Additional-Info',
      accountingDocExternalReference: 'fake-accountDoc',
      paymentID: 'fake-paymentID',
    );

    expect(paymentStatus.zzHtmcs, 'fake-zzHtmcs');
    expect(
      paymentStatus.paymentBatchAdditionalInfo,
      'fake-Batch-Additional-Info',
    );
    expect(paymentStatus.accountingDocExternalReference, 'fake-accountDoc');
    expect(paymentStatus.paymentID, 'fake-paymentID');
  });
}
