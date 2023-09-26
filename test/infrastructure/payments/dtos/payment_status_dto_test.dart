import 'package:ezrxmobile/domain/payments/entities/payment_status.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/payment_status_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic paymentStatus;
  group('Test Payment Status Dto ', () {
    setUp(() async {
      paymentStatus = PaymentStatus(
        uri: Uri.parse(
          'https://uat-vn.ezrx.com/my-account/thankyou?TxnStatus=53616c7465645f5fc43ab15f2f89a2de95b0584241d3a13c8f362f7a3f381aed&paymentId=53616c7465645f5f695668d5bbbf4cb0fd82d2235709e16923dae9aa4825a450508f24ad167ba1a5fb145fec903d2848&transactionReference=53616c7465645f5f155ff94a92e04b49941c1f31d393b934a6a36ca650b56d33&redirectFrom=VN',
        ),
      );
    });

    test('Test fromDomain', () {
      final paymentStatusDto = PaymentStatusDto.fromDomain(paymentStatus);
      expect(paymentStatusDto.txnStatus, '0');
      expect(paymentStatusDto.paymentID, '09EZ230000943101');
      expect(paymentStatusDto.transactionRef, '');
    });
  });
}
