import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'additional_details_data.freezed.dart';

@freezed
class AdditionalDetailsData with _$AdditionalDetailsData {
  const AdditionalDetailsData._();
  const factory AdditionalDetailsData({
    required CustomerPoReference customerPoReference,
    required SpecialInstruction specialInstruction,
    required ReferenceNote referenceNote,
    required CollectiveNumber collectiveNumber,
    required ContactPerson contactPerson,
    required ContactNumber contactNumber,
    required PaymentTerm paymentTerm,
    required DeliveryDate deliveryDate,
    required List<PoDocuments> poDocuments,
    required bool greenDeliveryEnabled,
  }) = _AdditionalDetailsData;

  factory AdditionalDetailsData.empty() => AdditionalDetailsData(
        customerPoReference: CustomerPoReference(''),
        specialInstruction: SpecialInstruction(''),
        referenceNote: ReferenceNote(''),
        collectiveNumber: CollectiveNumber(''),
        contactPerson: ContactPerson(''),
        contactNumber: ContactNumber(''),
        paymentTerm: PaymentTerm(''),
        deliveryDate: DeliveryDate(''),
        poDocuments: <PoDocuments>[],
        greenDeliveryEnabled: false,
      );
}
