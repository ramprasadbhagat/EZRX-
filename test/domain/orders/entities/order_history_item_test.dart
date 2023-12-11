import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  const fakePrice = 12.23;
  final pngPrincipleCode = PrincipalCode('105307');
  const priceNotAvailableText = 'Price Not Available';
  const freeText = 'FREE';

  group('OrderHistoryItem entity -', () {
    group('Item unit price -', () {
      test(
          'Display Price not available when is MYExternalSalesRep, material is PnG and invoice number is not valid',
          () {
        expect(
          OrderHistoryItem.empty()
              .copyWith
              .principalData(principalCode: pngPrincipleCode)
              .itemUnitPrice(true, true),
          priceNotAvailableText,
        );
      });

      test('Display 0 when is bonus and market is ID', () {
        expect(
          OrderHistoryItem.empty()
              .copyWith(isBonusMaterial: true)
              .itemUnitPrice(true, true),
          0.toString(),
        );
      });

      test('Display FREE when is bonus and market is not ID', () {
        expect(
          OrderHistoryItem.empty()
              .copyWith(isBonusMaterial: true)
              .itemUnitPrice(true, false),
          freeText,
        );
      });

      test('Display Price not available when price is 0', () {
        expect(
          OrderHistoryItem.empty()
              .copyWith(unitPrice: 0)
              .itemUnitPrice(true, false),
          priceNotAvailableText,
        );
      });

      test('Display normal price', () {
        expect(
          OrderHistoryItem.empty()
              .copyWith(unitPrice: fakePrice)
              .itemUnitPrice(true, false),
          fakePrice.toString(),
        );
      });
    });

    group('Item total price -', () {
      test(
          'Display Price not available when is MYExternalSalesRep, material is PnG and invoice number is not valid',
          () {
        expect(
          OrderHistoryItem.empty()
              .copyWith
              .principalData(principalCode: pngPrincipleCode)
              .itemTotalPrice(true, true),
          priceNotAvailableText,
        );
      });

      test('Display 0 when is bonus and market is ID', () {
        expect(
          OrderHistoryItem.empty()
              .copyWith(isBonusMaterial: true)
              .itemTotalPrice(true, true),
          0.toString(),
        );
      });

      test('Display FREE when is bonus and market is not ID', () {
        expect(
          OrderHistoryItem.empty()
              .copyWith(isBonusMaterial: true)
              .itemTotalPrice(true, false),
          freeText,
        );
      });

      test('Display Price not available when price is 0', () {
        expect(
          OrderHistoryItem.empty()
              .copyWith(totalPrice: 0)
              .itemTotalPrice(true, false),
          priceNotAvailableText,
        );
      });

      test('Display normal price', () {
        expect(
          OrderHistoryItem.empty()
              .copyWith(totalPrice: fakePrice)
              .itemTotalPrice(true, false),
          fakePrice.toString(),
        );
      });
    });
  });
}
