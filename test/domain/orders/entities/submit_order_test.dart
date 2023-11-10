import 'package:ezrxmobile/domain/order/entities/submit_order.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SubmitOrder test - ', () {
    test('Purchase order type', () {
      const fakePurchaseOrderType = 'fake-purchase-order-type';
      final submitOrder = SubmitOrder.empty()
          .copyWith(purchaseOrderType: fakePurchaseOrderType);
      expect(
        submitOrder.purchaseOrderType,
        fakePurchaseOrderType,
      );
    });
  });
}
