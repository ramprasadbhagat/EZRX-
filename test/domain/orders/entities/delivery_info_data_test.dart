import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DeliveryInfoData entity -', () {
    test('DeliveryInfoData empty', () {
      final emptyDeliveryInfoData = DeliveryInfoData.empty();

      expect(emptyDeliveryInfoData.poReference, PoReference(''));
      expect(
        emptyDeliveryInfoData.deliveryInstruction,
        DeliveryInstruction(''),
      );
      expect(emptyDeliveryInfoData.referenceNote, ReferenceNote(''));
      expect(emptyDeliveryInfoData.contactPerson, ContactPerson(''));
      expect(emptyDeliveryInfoData.mobileNumber, PhoneNumber(''));
      expect(emptyDeliveryInfoData.paymentTerm, PaymentTerm(''));
      expect(emptyDeliveryInfoData.deliveryDate, DateTimeStringValue(''));
      expect(emptyDeliveryInfoData.poDocuments, <PoDocuments>[]);
      expect(emptyDeliveryInfoData.greenDeliveryEnabled, false);
    });
  });
}
