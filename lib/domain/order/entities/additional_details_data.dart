import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
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

  factory AdditionalDetailsData.fromSavedOrder({
    required SavedOrder orderDetail,
    required CustomerCodeInfo customerCodeInfo,
  }) {
    final orderDeliveryDate = orderDetail.requestedDeliveryDate;

    return AdditionalDetailsData.empty().copyWith(
      contactPerson: ContactPerson(orderDetail.contactPerson),
      contactNumber: ContactNumber(
        orderDetail.phonenumber.isEmpty
            ? customerCodeInfo.telephoneNumber
            : orderDetail.phonenumber,
      ),
      customerPoReference: CustomerPoReference(orderDetail.poReference),
      specialInstruction: SpecialInstruction(orderDetail.specialInstructions),
      referenceNote: ReferenceNote(orderDetail.referenceNotes),
      collectiveNumber: CollectiveNumber(orderDetail.collectiveNo),
      paymentTerm: PaymentTerm(orderDetail.payTerm),
      poDocuments: orderDetail.poAttachent,
      deliveryDate: orderDeliveryDate.isEmpty
          ? defaultDeliveryDate
          : DeliveryDate(orderDeliveryDate),
    );
  }

  factory AdditionalDetailsData.empty() => AdditionalDetailsData(
        customerPoReference: CustomerPoReference(''),
        specialInstruction: SpecialInstruction(''),
        referenceNote: ReferenceNote(''),
        collectiveNumber: CollectiveNumber(''),
        contactPerson: ContactPerson(''),
        contactNumber: ContactNumber(''),
        paymentTerm: PaymentTerm(''),
        deliveryDate: defaultDeliveryDate,
        poDocuments: <PoDocuments>[],
        greenDeliveryEnabled: false,
      );

  static DeliveryDate get defaultDeliveryDate => DeliveryDate(
        DateFormat('yyyy-MM-dd').format(
          DateTime.now().add(
            const Duration(days: 1),
          ),
        ),
      );
}
