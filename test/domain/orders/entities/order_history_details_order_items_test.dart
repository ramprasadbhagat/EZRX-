import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  const fakePrice = 12.23;
  final fakeValidInvoice = StringValue('fake-test');
  final fakeInvalidInvoice = StringValue('');
  final pngPrincipleCode = PrincipalCode('105307');
  final comOrderItemType = OrderItemType('Comm');
  final bonusOrderItemType = OrderItemType('Bonus');
  const priceNotAvailableText = 'Price Not Available';
  const freeText = 'FREE';

  group('OrderHistoryDetailOrderItem entity -', () {
    group('Item unit price -', () {
      test(
          'Display Price not available when is MYExternalSalesRep, material is PnG and invoice number is not valid',
          () {
        expect(
          OrderHistoryDetailsOrderItem.empty()
              .copyWith(
                type: comOrderItemType,
                principalData: PrincipalData.empty().copyWith(
                  principalCode: pngPrincipleCode,
                ),
              )
              .itemUnitPrice(fakeInvalidInvoice, true, true),
          priceNotAvailableText,
        );
      });

      test('Display 0 when is bonus and market is ID', () {
        expect(
          OrderHistoryDetailsOrderItem.empty()
              .copyWith(type: bonusOrderItemType)
              .itemUnitPrice(fakeValidInvoice, true, true),
          0.toString(),
        );
      });

      test('Display FREE when is bonus and market is not ID', () {
        expect(
          OrderHistoryDetailsOrderItem.empty()
              .copyWith(type: bonusOrderItemType)
              .itemUnitPrice(fakeValidInvoice, true, false),
          freeText,
        );
      });

      test('Display Price not available when price is 0', () {
        expect(
          OrderHistoryDetailsOrderItem.empty()
              .copyWith(unitPrice: 0)
              .itemUnitPrice(fakeValidInvoice, true, false),
          priceNotAvailableText,
        );
      });

      test('Display normal price', () {
        expect(
          OrderHistoryDetailsOrderItem.empty()
              .copyWith(unitPrice: fakePrice)
              .itemUnitPrice(fakeValidInvoice, true, false),
          fakePrice.toString(),
        );
      });
    });

    group('Item total price -', () {
      test(
          'Display Price not available when is MYExternalSalesRep, material is PnG and invoice number is not valid',
          () {
        expect(
          OrderHistoryDetailsOrderItem.empty()
              .copyWith(
                type: comOrderItemType,
                principalData: PrincipalData.empty().copyWith(
                  principalCode: pngPrincipleCode,
                ),
              )
              .itemTotalPrice(fakeInvalidInvoice, true, true),
          priceNotAvailableText,
        );
      });

      test('Display 0 when is bonus and market is ID', () {
        expect(
          OrderHistoryDetailsOrderItem.empty()
              .copyWith(type: bonusOrderItemType)
              .itemTotalPrice(fakeValidInvoice, true, true),
          0.toString(),
        );
      });

      test('Display FREE when is bonus and market is not ID', () {
        expect(
          OrderHistoryDetailsOrderItem.empty()
              .copyWith(type: bonusOrderItemType)
              .itemTotalPrice(fakeValidInvoice, true, false),
          freeText,
        );
      });

      test('Display Price not available when price is 0', () {
        expect(
          OrderHistoryDetailsOrderItem.empty()
              .copyWith(totalPrice: 0)
              .itemTotalPrice(fakeValidInvoice, true, false),
          priceNotAvailableText,
        );
      });

      test('Display normal price', () {
        expect(
          OrderHistoryDetailsOrderItem.empty()
              .copyWith(totalPrice: fakePrice)
              .itemTotalPrice(fakeValidInvoice, true, false),
          fakePrice.toString(),
        );
      });
    });
  });
}
