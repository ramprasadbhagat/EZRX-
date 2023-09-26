import 'package:ezrxmobile/domain/payments/entities/payment_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Payment Status', () {
    final paymentStatus = PaymentStatus(
      uri: Uri.parse(
        'https://uat-vn.ezrx.com/my-account/thankyou?TxnStatus=53616c7465645f5fc43ab15f2f89a2de95b0584241d3a13c8f362f7a3f381aed&paymentId=53616c7465645f5f695668d5bbbf4cb0fd82d2235709e16923dae9aa4825a450508f24ad167ba1a5fb145fec903d2848&transactionReference=53616c7465645f5f155ff94a92e04b49941c1f31d393b934a6a36ca650b56d33&redirectFrom=VN',
      ),
    );

    expect(
      paymentStatus.uri,
      Uri.parse(
        'https://uat-vn.ezrx.com/my-account/thankyou?TxnStatus=53616c7465645f5fc43ab15f2f89a2de95b0584241d3a13c8f362f7a3f381aed&paymentId=53616c7465645f5f695668d5bbbf4cb0fd82d2235709e16923dae9aa4825a450508f24ad167ba1a5fb145fec903d2848&transactionReference=53616c7465645f5f155ff94a92e04b49941c1f31d393b934a6a36ca650b56d33&redirectFrom=VN',
      ),
    );
    expect(
      paymentStatus.txnStatusEncrypt,
      '53616c7465645f5fc43ab15f2f89a2de95b0584241d3a13c8f362f7a3f381aed',
    );
    expect(
      paymentStatus.paymentIdEncrypt,
      '53616c7465645f5f695668d5bbbf4cb0fd82d2235709e16923dae9aa4825a450508f24ad167ba1a5fb145fec903d2848',
    );
    expect(
      paymentStatus.transactionRefEncrypt,
      '53616c7465645f5f155ff94a92e04b49941c1f31d393b934a6a36ca650b56d33',
    );
    expect(
      paymentStatus.host,
      'uat-vn.ezrx.com',
    );
  });
}
