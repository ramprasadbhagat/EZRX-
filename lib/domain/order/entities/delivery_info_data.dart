import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_info_data.freezed.dart';

@freezed
class DeliveryInfoData with _$DeliveryInfoData {
  const DeliveryInfoData._();
  const factory DeliveryInfoData({
    required PoReference poReference,
    required DeliveryInstruction deliveryInstruction,
    required ReferenceNote referenceNote,
    required ContactPerson contactPerson,
    required PhoneNumber mobileNumber,
    required PaymentTerm paymentTerm,
    required DateTimeStringValue deliveryDate,
    required List<PoDocuments> poDocuments,
    required bool greenDeliveryEnabled,
  }) = _DeliveryInfoData;

  factory DeliveryInfoData.fromOrderHistory({
    required OrderHistoryDetails orderHistoryDetails,
  }) {
    return DeliveryInfoData.empty().copyWith(
      poReference: PoReference(
        orderHistoryDetails.pOReference.displayPOReference,
      ),
      contactPerson: ContactPerson(
        orderHistoryDetails.orderBy.getOrDefaultValue(''),
      ),
      mobileNumber: PhoneNumber(
        orderHistoryDetails.telephoneNumber.getOrDefaultValue(''),
      ),
      deliveryInstruction: DeliveryInstruction(
        orderHistoryDetails.orderHistoryDetailsSpecialInstructions
            .getOrDefaultValue(''),
      ),
      referenceNote: ReferenceNote(
        orderHistoryDetails.referenceNotes,
      ),
      // collectiveNumber: CollectiveNumber(''),
      paymentTerm: PaymentTerm(
        '${orderHistoryDetails.orderHistoryDetailsPaymentTerm.paymentTermCode.getOrDefaultValue('')}-${orderHistoryDetails.orderHistoryDetailsPaymentTerm.paymentTermDescription.getOrDefaultValue('')}',
      ),
      poDocuments: orderHistoryDetails.orderHistoryDetailsPoDocuments,
    );
  }

  factory DeliveryInfoData.empty() => DeliveryInfoData(
        poReference: PoReference(''),
        deliveryInstruction: DeliveryInstruction(''),
        referenceNote: ReferenceNote(''),
        // collectiveNumber: CollectiveNumber(''),
        contactPerson: ContactPerson(''),
        mobileNumber: PhoneNumber(''),
        paymentTerm: PaymentTerm(''),
        deliveryDate: DateTimeStringValue(''),
        poDocuments: <PoDocuments>[],
        greenDeliveryEnabled: false,
      );
}
