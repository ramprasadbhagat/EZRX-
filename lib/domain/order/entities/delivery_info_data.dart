import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
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
    required MobileNumber mobileNumber,
    required PaymentTerm paymentTerm,
    required DeliveryDate deliveryDate,
    required List<PoDocuments> poDocuments,
    required bool greenDeliveryEnabled,
  }) = _DeliveryInfoData;

  factory DeliveryInfoData.fromSavedOrder({
    required SavedOrder orderDetail,
    required CustomerCodeInfo customerCodeInfo,
  }) {
    final orderDeliveryDate = orderDetail.requestedDeliveryDate;

    return DeliveryInfoData.empty().copyWith(
      contactPerson: ContactPerson(orderDetail.contactPerson),
      mobileNumber: MobileNumber(
        orderDetail.phonenumber.isEmpty
            ? customerCodeInfo.telephoneNumber.displayTelephoneNumber
            : orderDetail.phonenumber,
      ),
      poReference: PoReference(orderDetail.poReference),
      deliveryInstruction: DeliveryInstruction(orderDetail.specialInstructions),
      referenceNote: ReferenceNote(orderDetail.referenceNotes),
      // collectiveNumber: CollectiveNumber(orderDetail.collectiveNo),
      paymentTerm: PaymentTerm(orderDetail.payTerm),
      poDocuments: orderDetail.poAttachent,
      deliveryDate: orderDeliveryDate.isEmpty
          ? defaultDeliveryDate
          : DeliveryDate(orderDeliveryDate),
      greenDeliveryEnabled: orderDetail.shippingCondition.isGreenDelivery,
    );
  }

  factory DeliveryInfoData.fromOrderHistory({
    required OrderHistoryDetails orderHistoryDetails,
  }) {
    return DeliveryInfoData.empty().copyWith(
      poReference: PoReference(
        orderHistoryDetails.orderHistoryDetailsShippingInformation.pOReference
            .displayPOReference,
      ),
      contactPerson: ContactPerson(
        orderHistoryDetails.orderHistoryDetailsOrderHeader.orderBy,
      ),
      mobileNumber: MobileNumber(
        orderHistoryDetails.orderHistoryDetailsOrderHeader.telephoneNumber
            .getOrDefaultValue(''),
      ),
      deliveryInstruction: DeliveryInstruction(
        orderHistoryDetails.orderHistoryDetailsSpecialInstructions
            .getOrDefaultValue(''),
      ),
      referenceNote: ReferenceNote(
        orderHistoryDetails.orderHistoryDetailsOrderHeader.referenceNotes,
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
        mobileNumber: MobileNumber(''),
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
