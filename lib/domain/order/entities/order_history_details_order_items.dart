import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_tender_contract_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_details_order_items.freezed.dart';

@freezed
class OrderHistoryDetailsOrderItem with _$OrderHistoryDetailsOrderItem {
  const OrderHistoryDetailsOrderItem._();
  factory OrderHistoryDetailsOrderItem({
    required OrderItemType type,
    required MaterialNumber materialNumber,
    required String materialDescription,
    required int qty,
    required ZpPrice unitPrice,
    required TotalPrice totalPrice,
    required double tax,
    required SAPStatus sAPStatus,
    required DateTimeStringValue plannedDeliveryDate,
    required int pickedQuantity,
    required String batch,
    required DateTimeStringValue expiryDate,
    required Remarks lineReferenceNotes,
    required bool isTenderContractMaterial,
    required List<OrderHistoryDetailsOrderItemDetails> details,
    required OrderHistoryDetailsOrderItemTenderContractDetails
        tenderContractDetails,
  }) = _OrderHistoryDetailsOrderItem;

  factory OrderHistoryDetailsOrderItem.empty() => OrderHistoryDetailsOrderItem(
        type: OrderItemType(''),
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        qty: 0,
        unitPrice: ZpPrice('0.0'),
        totalPrice: TotalPrice('0.0'),
        tax: 0.0,
        sAPStatus: SAPStatus(''),
        plannedDeliveryDate: DateTimeStringValue(''),
        pickedQuantity: 0,
        batch: '',
        expiryDate: DateTimeStringValue(''),
        lineReferenceNotes: Remarks(''),
        isTenderContractMaterial: false,
        details: <OrderHistoryDetailsOrderItemDetails>[],
        tenderContractDetails:
            OrderHistoryDetailsOrderItemTenderContractDetails.empty(),
      );

  MaterialQueryInfo get queryInfo => MaterialQueryInfo.fromOrderHistoryDetails(
        orderHistoryDetailsOrderItem: this,
      );

  String get batchAndExpiryDate => '$batch:${expiryDate.toValidDateString}';
  String get deliveryDate => plannedDeliveryDate.isNotEmpty
      ? plannedDeliveryDate.toValidDateString
      : '-';
}
