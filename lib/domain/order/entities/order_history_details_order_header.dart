import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_group.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_details_order_header.freezed.dart';

@freezed
class OrderHistoryDetailsOrderHeader with _$OrderHistoryDetailsOrderHeader {
  const OrderHistoryDetailsOrderHeader._();

  factory OrderHistoryDetailsOrderHeader({
    required double totalTax,
    required DateTimeStringValue requestedDeliveryDate,
    required String type,
    required PhoneNumber telephoneNumber,
    required double orderValue,
    required DateTimeStringValue createdDate,
    required String eZRXNumber,
    required String orderBy,
    required String referenceNotes,
    required String orderReason,
    required OrderNumber
        orderNumber, //used for orderHistory api in view vy order section
    required String soldTo,
    required String shipTo,
    required CompanyName companyName,
    required String createdTime,
    required POReference pOReference,
    required int itemCount,
    required String itmDescription,
    required bool hasPOAttachment,
  }) = _OrderHistoryDetailsOrderHeader;

  factory OrderHistoryDetailsOrderHeader.empty() =>
      OrderHistoryDetailsOrderHeader(
        totalTax: 0.0,
        requestedDeliveryDate: DateTimeStringValue(''),
        type: '',
        telephoneNumber: PhoneNumber(''),
        orderValue: 0.0,
        createdDate: DateTimeStringValue(''),
        eZRXNumber: '',
        orderBy: '',
        referenceNotes: '',
        orderReason: '',
        companyName: CompanyName(''),
        createdTime: '',
        hasPOAttachment: false,
        itmDescription: '',
        itemCount: 0,
        orderNumber: OrderNumber(''),
        pOReference: POReference(''),
        shipTo: '',
        soldTo: '',
      );

  double get grandTotal => orderValue + totalTax;
}

extension ViewByOrderListExtension on List<OrderHistoryDetailsOrderHeader> {
  List<ViewByOrdersGroup> get getViewByOrderGroupList {
    return List<OrderHistoryDetailsOrderHeader>.from(this)
        .groupListsBy((item) => item.createdDate)
        .entries
        .map(
          (entry) => ViewByOrdersGroup(
            createdDate: entry.key,
            orderHeaders: entry.value,
            principalName: PrincipalName(''),
            viewByOrderItem: <OrderHistoryDetailsOrderItem>[],
          ),
        )
        .toList();
  }
}
